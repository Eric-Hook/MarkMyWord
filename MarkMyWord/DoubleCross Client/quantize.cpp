//#include "stdafx.h"
#include "os.h"
#include "core.h"
#include "quantize.h"

CQuantizer::CQuantizer (UINT nMaxColors, UINT nColorBits)
{
//    ASSERT (nColorBits <= 8);

    m_pTree = NULL;
    m_nLeafCount = 0;
    for (int i=0; i<=(int) nColorBits; i++)
        m_pReducibleNodes[i] = NULL;
    m_nMaxColors = nMaxColors;
    m_nColorBits = nColorBits;
}

CQuantizer::~CQuantizer ()
{
    if (m_pTree != NULL)
        DeleteTree (&m_pTree);
}

BOOL CQuantizer::ProcessImage (RGB *image, int width, int height)
	{
    BYTE* pbBits;
    BYTE r, g, b;
    int i, j;

    int bmWidthBytes = width;
    int biWidth = width;
    int biHeight = height;
    int biBitCount = 24;
	void *bmBits = image;

	int nPad = 0;

    switch (biBitCount) {
    case 24: // 24-bit DIB
        pbBits = (BYTE*) bmBits;
        for (i=0; i<biHeight; i++) {
            for (j=0; j<biWidth; j++) {
                r = *pbBits++;
                g = *pbBits++;
                b = *pbBits++;
                AddColor (&m_pTree, r, g, b, m_nColorBits, 0, &m_nLeafCount,
                    m_pReducibleNodes);
                while (m_nLeafCount > m_nMaxColors)
                    ReduceTree (m_nColorBits, &m_nLeafCount, m_pReducibleNodes);
            }
            pbBits += nPad;
        }
        break;

    default: // Unrecognized color format
        return FALSE;
    }
    return TRUE;
	}

int CQuantizer::GetLeftShiftCount (DWORD dwVal)
{
    int nCount = 0;
    for (int i=0; i<sizeof (DWORD) * 8; i++) {
        if (dwVal & 1)
            nCount++;
        dwVal >>= 1;
    }
    return (8 - nCount);
}

int CQuantizer::GetRightShiftCount (DWORD dwVal)
{
    for (int i=0; i<sizeof (DWORD) * 8; i++) {
        if (dwVal & 1)
            return i;
        dwVal >>= 1;
    }
    return -1;
}

void CQuantizer::AddColor (NODE** ppNode, BYTE r, BYTE g, BYTE b,
    UINT nColorBits, UINT nLevel, UINT* pLeafCount, NODE** pReducibleNodes)
{
    static BYTE mask[8] = { 0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01 };

    //
    // If the node doesn't exist, create it.
    //
    if (*ppNode == NULL)
        *ppNode = CreateNode (nLevel, nColorBits, pLeafCount,
            pReducibleNodes);

    //
    // Update color information if it's a leaf node.
    //
    if ((*ppNode)->bIsLeaf) {
        (*ppNode)->nPixelCount++;
        (*ppNode)->nRedSum += r;
        (*ppNode)->nGreenSum += g;
        (*ppNode)->nBlueSum += b;
    }

    //
    // Recurse a level deeper if the node is not a leaf.
    //
    else {
        int shift = 7 - nLevel;
        int nIndex = (((r & mask[nLevel]) >> shift) << 2) |
            (((g & mask[nLevel]) >> shift) << 1) |
            ((b & mask[nLevel]) >> shift);
        AddColor (&((*ppNode)->pChild[nIndex]), r, g, b, nColorBits,
            nLevel + 1, pLeafCount, pReducibleNodes);
    }
}

NODE* CQuantizer::CreateNode (UINT nLevel, UINT nColorBits, UINT* pLeafCount,
    NODE** pReducibleNodes)
{
    NODE* pNode;

    if ((pNode = (NODE*) new BYTE[sizeof (NODE)]) == NULL)
        return NULL;
	memset(pNode, 0, sizeof(NODE));

    pNode->bIsLeaf = (nLevel == nColorBits) ? TRUE : FALSE;
    if (pNode->bIsLeaf)
        (*pLeafCount)++;
    else {
        pNode->pNext = pReducibleNodes[nLevel];
        pReducibleNodes[nLevel] = pNode;
    }
    return pNode;
}

void CQuantizer::ReduceTree (UINT nColorBits, UINT* pLeafCount,
    NODE** pReducibleNodes)
{
	int i;
    //
    // Find the deepest level containing at least one reducible node.
    //
    for (i=nColorBits - 1; (i>0) && (pReducibleNodes[i] == NULL); i) i--;

    //
    // Reduce the node most recently added to the list at level i.
    //
    NODE* pNode = pReducibleNodes[i];
    pReducibleNodes[i] = pNode->pNext;

    UINT nRedSum = 0;
    UINT nGreenSum = 0;
    UINT nBlueSum = 0;
    UINT nChildren = 0;

    for (i=0; i<8; i++) {
        if (pNode->pChild[i] != NULL) {
            nRedSum += pNode->pChild[i]->nRedSum;
            nGreenSum += pNode->pChild[i]->nGreenSum;
            nBlueSum += pNode->pChild[i]->nBlueSum;
            pNode->nPixelCount += pNode->pChild[i]->nPixelCount;
            delete[] pNode->pChild[i];
            pNode->pChild[i] = NULL;
            nChildren++;
        }
    }

    pNode->bIsLeaf = TRUE;
    pNode->nRedSum = nRedSum;
    pNode->nGreenSum = nGreenSum;
    pNode->nBlueSum = nBlueSum;
    *pLeafCount -= (nChildren - 1);
}

void CQuantizer::DeleteTree (NODE** ppNode)
{
    for (int i=0; i<8; i++) {
        if ((*ppNode)->pChild[i] != NULL)
            DeleteTree (&((*ppNode)->pChild[i]));
    }
    delete[] *ppNode;
    *ppNode = NULL;
}

void CQuantizer::GetPaletteColors (NODE* pTree, RGBQUAD* prgb, UINT* pIndex)
{
    if (pTree->bIsLeaf) {
        prgb[*pIndex].rgbRed =
            (BYTE) ((pTree->nRedSum) / (pTree->nPixelCount));
        prgb[*pIndex].rgbGreen =
            (BYTE) ((pTree->nGreenSum) / (pTree->nPixelCount));
        prgb[*pIndex].rgbBlue =
            (BYTE) ((pTree->nBlueSum) / (pTree->nPixelCount));
        prgb[*pIndex].rgbReserved = 0;
        (*pIndex)++;
    }
    else {
        for (int i=0; i<8; i++) {
            if (pTree->pChild[i] != NULL)
                GetPaletteColors (pTree->pChild[i], prgb, pIndex);
        }
    }
}

UINT CQuantizer::GetColorCount ()
{
    return m_nLeafCount;
}

void CQuantizer::GetColorTable (RGBQUAD* prgb)
{
    UINT nIndex = 0;
    GetPaletteColors (m_pTree, prgb, &nIndex);
}