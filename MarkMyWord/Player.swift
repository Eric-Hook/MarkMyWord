//
//  MMWPlayer.swift
//  MarkMyWord
//
//  Created by Eric Hook on 5/14/15.
//  Copyright (c) 2015 Hook Studios. All rights reserved.
//

import Foundation
import SpriteKit

class Player {
    
    var playerID : Int = 1
    var playerName : String = ""
    var playerScore : Int = 0
    var doIt : Bool = false
    var didIt : Bool = false
    //var playerSeat : MMWSeat
    var playerColor : Int = 0
    
    var playerLetterTiles : [MMWTile]! = nil
    var playerLetterGrid: Grid! = nil
    
    var playerSpecialTiles : [MMWTile]! = nil
    var playerLetterTilesPlayed : [MMWTile]? = nil
    
    init (_playerID : Int, _playerName : String, _playerColor : Int) {
        //playerSeat = MMWSeat(_playerSeatNum: 1, _seatColorNumber: _playerColor)
        //playerColor = playerSeat.seatUIColor
        playerColor = _playerColor
        playerID = _playerID
        playerName = _playerName
    }
    
    func setPlayerTilesArray (inout playerTiles: [MMWTile]) {
        playerLetterTiles = playerTiles
    }
    
    func setPlayerTilesGrid (inout playerTilesGrid: Grid) {
        playerLetterGrid = playerTilesGrid
    }
    
//    getNewTiles (numTilesToGet: Int) {
//        while playerLetterTiles.count < 7 &&
//    }
    
}