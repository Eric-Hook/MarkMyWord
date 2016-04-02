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
    var playerName  = "Player"
    var playerScore = 0
    var playerColor = 0

    var isHuman = false
    
    var playerAvatarNumber = 0
    
    var playerMeyamaNumber = 0
    
    var playerSkillLevel = 1
    
    enum playerSkillLevel : Int {
        case low = 0, mid = 1, high = 2
    }

    weak var playerLetterGrid : Grid! = nil
    weak var playerView : PlayerView! = nil
 
    init (_playerID : Int, _playerName : String, _playerColor : Int) {
        //if playerID > 0 { isHuman = false } // only player 1 defaults to human
        playerColor = _playerColor
        playerID = _playerID
        playerName = _playerName
        playerAvatarNumber = (playerID > 1) ? ( playerID - 1 ) : 0
        playerMeyamaNumber = (playerID > 1) ? ( playerID - 1 ) : 0
        if playerID == 1 {isHuman = true} // Player 1 always human
        
    }

    func setPlayerTilesGrid (inout playerTilesGrid: Grid) {
        self.playerLetterGrid = playerTilesGrid
    }
    
    func setPlayerView (inout playerView: PlayerView) {
        self.playerView = playerView
    }
    
    deinit {
        print("player is being deinitialized")
    }
}