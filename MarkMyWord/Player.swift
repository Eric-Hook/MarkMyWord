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
    
    var playerID    = 0
    var playerName  = ""
    var playerScore = 0
    var doIt        = false
    var didIt       = false
    var playerColor = 0
    
    var playerLetterTiles : [MMWTile]! = nil
    var playerLetterGrid: Grid! = nil
    
    var playerView : PlayerView! = nil
    
    //var playerSpecialTiles : [MMWTile]! = nil
    //var playerLetterTilesPlayed : [MMWTile]? = nil

    var mmwGameSceneViewController : MMWGameSceneViewController!
    var mmwGameScene : MMWGameScene!
    
    init (_playerID : Int, _playerName : String, _playerColor : Int) {
        playerColor = _playerColor
        playerID = _playerID
        playerName = _playerName
    }
    
    func setPlayerTilesArray (inout playerTiles: [MMWTile]) {
        self.playerLetterTiles = playerTiles
    }
    
    func setPlayerTilesGrid (inout playerTilesGrid: Grid) {
        self.playerLetterGrid = playerTilesGrid
    }
    
    func setPlayerView (playerView: PlayerView, mmwGameScene: MMWGameScene, mmwGameSceneViewController: MMWGameSceneViewController) {
        self.playerView = playerView
        self.mmwGameScene = mmwGameScene
        self.mmwGameSceneViewController = mmwGameSceneViewController
    }
}