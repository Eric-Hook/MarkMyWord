//
//  GameViewController.swift
//  MarkMyWord
//
//  Created by Eric Hook on 4/10/15.
//  Copyright (c) 2015 Hook Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import CoreMotion

extension StreamReader : SequenceType {
    func generate() -> AnyGenerator<String> {
        return anyGenerator {
            return self.nextLine()
        }
    }
}

class MMWGameSceneViewController {
    
    var mmwGameScene: MMWGameScene!
    var viewSize : CGSize!
    var tileCollection : MMWTileBuilder = MMWTileBuilder()
    var tilesPlayable : [MMWTile]
    var numPlayers : Int = 3
    var playerTurn :  Int = 1
    
    var player1 : Player = Player(_playerID: 1, _playerName: "Abe", _playerColor: 1)
    var player2 : Player = Player(_playerID: 2, _playerName: "Bart", _playerColor: 2)
    // player 3 and 4 objects created but only used in 3 or 4 player games
    var player3 : Player = Player(_playerID: 3, _playerName: "Charlie", _playerColor: 3)
    var player4 : Player = Player(_playerID: 4, _playerName: "Dan", _playerColor: 4)
    
    let playerArray : [Player]! // array of all players 0-3 for easier iteration of player turns

    init (size: CGSize) {
        viewSize = size
        mmwGameScene = MMWGameScene(size: viewSize)
//        /* Set the scale mode to scale to fit the window */
//        mmwGameScene.scaleMode = .AspectFill
        playerArray  = [player1, player2, player3, player4]
        tilesPlayable = tileCollection.mmwTileArray
        mmwGameScene.setViewController(self)
        mmwGameScene.setGrids() // sets tile grid positions, size of square, number of squares and position on screen for each grid possible
        
        
        mmwGameScene.buildGameView()
        
        setUpPlayers() // add player to view, match player to grid, fill grid with starter tiles and colorize to player color
    }
 
    func setUpPlayers () {
        mmwGameScene.setViewController(self)
        if numPlayers == 2 {
            makeTwoPlayers()
        }
        
        if numPlayers == 3 {
            makeThreePlayers()
        }
        
        if numPlayers == 4 {
            makeFourPlayers()
        }
    }
    
    func makeTwoPlayers () {
        //mmwGameScene.addPlayerView(1, playerView: PlayerView(mmwPlayer: player1))
        player1.setPlayerTilesGrid(&mmwGameScene.mmwPlayer1Grid!)
        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer1Grid!)
        player1.setPlayerView(mmwGameScene.player1View)
        
        //mmwGameScene.addPlayerView(2, playerView: PlayerView(mmwPlayer: player2))
        player2.setPlayerTilesGrid(&mmwGameScene.mmwPlayer2Grid!)
        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer2Grid!)
        player2.setPlayerView(mmwGameScene.player2View)
        
        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwBoardGrid!)
    }
    
    func makeThreePlayers () {
        makeTwoPlayers()
        
        //mmwGameScene.addPlayerView(3, playerView: PlayerView(mmwPlayer: player3))
        player3.setPlayerTilesGrid(&mmwGameScene.mmwPlayer3Grid!)
        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer3Grid!)
        player3.setPlayerView(mmwGameScene.player3View)
    }
    
    func makeFourPlayers () {
        makeThreePlayers()
        
        //mmwGameScene.addPlayerView(4, playerView: PlayerView(mmwPlayer: player4))
        player4.setPlayerTilesGrid(&mmwGameScene.mmwPlayer4Grid!)
        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer4Grid!)
        player4.setPlayerView(mmwGameScene.player4View)
    }
    
//    func getWord (wordSize: Int = 5, letterDrawInput: [MMWTile] = tilesPlayable) {
//        
//    }
    
//    func makeTwoPlayers () {
//        mmwGameScene.addPlayerView(1, playerView: PlayerView(mmwPlayer: player1))
//        player1.setPlayerTilesGrid(&mmwGameScene.mmwPlayer1Grid!)
//        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer1Grid!, tilesFrom: &tileCollection.mmwTileArray, changeColorTo: 1)
//        mmwGameScene.addPlayerView(2, playerView: PlayerView(mmwPlayer: player2))
//        player2.setPlayerTilesGrid(&mmwGameScene.mmwPlayer2Grid!)
//        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer2Grid!, tilesFrom: &tileCollection.mmwTileArray, changeColorTo: 2)
//        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwBoardGrid!, tilesFrom: &tileCollection.mmwTileArray, changeColorTo: 0)
//    }
//    func makeThreePlayers () {
//        makeTwoPlayers()
//        mmwGameScene.addPlayerView(3, playerView: PlayerView(mmwPlayer: player3))
//        player3.setPlayerTilesGrid(&mmwGameScene.mmwPlayer3Grid!)
//        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer3Grid!, tilesFrom: &tileCollection.mmwTileArray, changeColorTo: 3)
//    }
//    func makeFourPlayers () {
//        makeThreePlayers()
//        mmwGameScene.addPlayerView(4, playerView: PlayerView(mmwPlayer: player4))
//        player4.setPlayerTilesGrid(&mmwGameScene.mmwPlayer4Grid!)
//        tileCollection.fillGridWithBlankTiles(&mmwGameScene.mmwPlayer4Grid!, tilesFrom: &tileCollection.mmwTileArray, changeColorTo: 4)
//    }

//    func presentMMWScene() {
//
//        let transition = SKTransition.crossFadeWithDuration(2.0)
//        let MMWScene = MMWGameScene(size: view.bounds.size)
//        MMWScene.name = "MMWScene instance name made in GameScene"
//        //var currentScene = MMWScene
//        mmwGameScene.presentMenuScene()
//        //scene.presentScene(MMWScene, transition: transition)
//        print("presentMMWScene")
//        MMWScene.player1View?.playerNameLabel.text = "Fred"
//        
//        //MMWScene.player1View?.playerNameLabel.text = MMWScene.player1!.playerName
//        //MMWScene.changePlayerScore(MMWScene.player1View!, player: MMWScene.player1!, score: 22)
//        MMWScene.player1View?.playerScoreLabel.text = String(33)
//    }
//    
//    func presentMMWScene() {
//        
//        print("in GameViewController presentMMWScene 1")
//        let mmwScene = MMWGameScene(size: view.bounds.size)
//        
//        // Configure the view.
//        let skView = self.view as! SKView
//        skView.showsFPS = true
//        skView.showsNodeCount = true
//        
//        /* Sprite Kit applies additional optimizations to improve rendering performance */
//        skView.ignoresSiblingOrder = true
//        
//        /* Set the scale mode to scale to fit the window */
//        mmwScene.scaleMode = .AspectFill
//        
//        skView.presentScene(mmwScene)
//        print("in GameViewController presentMMWScene 2")
//        
//        //MMWGameSceneViewController()
//        //presentMMWScene()
//        print("in GameViewController presentMMWScene 3")
//        
//        mmwScene.changePlayerScore(mmwScene.player2View!, player: mmwScene.player2!, score: 2468)
//    }

    //func fillTiles(inout tilesFrom: [MMWTile], inout tilesTo: [MMWTile], changeColorTo: UIColor) {
//        let originalTilesGet = numTilesGet
//        while numTilesGet > 0 {
//            let numTiles : UInt32 = UInt32(tilesFrom.count - 1)
//            let tileInArr = arc4random_uniform( numTiles ) // select random tile in FROM array
//            let tileRemoved : MMWTile = tilesFrom.removeAtIndex( Int(tileInArr) )
//            tileRemoved.tileSprite.color = changeColorTo
//            tilesTo.insert(tileRemoved, atIndex: originalTilesGet - numTilesGet)
//            //tilesTo.append( tileRemoved )
//            numTilesGet--
//        }
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Release any cached data, images, etc that aren't in use.
//    }
}




