# Microsoft Developer Studio Project File - Name="DoubleCross Server" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=DoubleCross Server - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "DoubleCross Server.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DoubleCross Server.mak"\
 CFG="DoubleCross Server - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DoubleCross Server - Win32 Release" (based on\
 "Win32 (x86) Application")
!MESSAGE "DoubleCross Server - Win32 Debug" (based on\
 "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""$/Client-Server/games/DoubleCross Server", GDMAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "DoubleCross Server - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I "..\..\Connection Manager" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o NUL /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 wsock32.lib winmm.lib comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "DoubleCross Server - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\..\Connection Manager" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o NUL /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o NUL /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 wsock32.lib winmm.lib comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "DoubleCross Server - Win32 Release"
# Name "DoubleCross Server - Win32 Debug"
# Begin Group "Connection Manager"

# PROP Default_Filter ""
# Begin Source File

SOURCE="..\..\Connection Manager\cmBase.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmConMgr.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmConMgr.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmConn.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmConn.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmMsg.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmObject.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmObject.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmRingbuf.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmRingbuf.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmSocket.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmSocket.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\cmUtil.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\icmpAPI.h"
# End Source File
# Begin Source File

SOURCE="..\..\Connection Manager\ipexport.h"
# End Source File
# End Group
# Begin Source File

SOURCE=".\DoubleCross Server.rc"
# End Source File
# Begin Source File

SOURCE=.\DoubleCrossEngine.cpp
# End Source File
# Begin Source File

SOURCE=.\DoubleCrossServer.cpp
# End Source File
# Begin Source File

SOURCE=.\DoubleCrossServerTable.cpp
# End Source File
# Begin Source File

SOURCE=.\main.cpp
# End Source File
# Begin Source File

SOURCE=.\miniwin.h
# End Source File
# Begin Source File

SOURCE=.\random.cpp
# End Source File
# Begin Source File

SOURCE=.\RoomServer.cpp
# End Source File
# Begin Source File

SOURCE=.\sendmail.cpp
# End Source File
# Begin Source File

SOURCE=.\SNMachineID.cpp
# End Source File
# Begin Source File

SOURCE=.\wgdict.cpp
# End Source File
# End Target
# End Project
