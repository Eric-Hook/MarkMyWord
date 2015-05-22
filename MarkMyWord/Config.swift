//
//  CardController.swift
//
//
//  Created by Eric Hook on 4/29/15.
//  Copyright (c) 2015 Hook Studios. All rights reserved.
//

import Foundation
import UIKit

//// UI Constants /////////////////////////////////
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

// Random number generator /////////////////////
func randomNumber(#minX:UInt32, #maxX:UInt32) -> Int {
  let result = (arc4random() % (maxX - minX + 1)) + minX
  return Int(result)
}

let TileMargin: CGFloat = 20.0

//// Fonts ///////////////////////////////////////
//let FontHUD = UIFont(name:"comic andy", size: 62.0)!
//let FontHUDBig = UIFont(name:"comic andy", size:120.0)!
let FontHUD = UIFont(name:"HelveticaNeue-Bold", size: 18.0)!
let FontHUDName = "HelveticaNeue-Bold"
let FontHUDSize : CGFloat = 18.0

let FontHUDBig = UIFont(name:"HelveticaNeue-Bold", size:120.0)!
let FontHUDBigName = "HelveticaNeue-Bold"
let FontHUDBigSize : CGFloat = 120.0

//// Colors //////////////////////////////////////
let FontHUDWhite = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let FontHUDRed = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
let FontHUDBlack = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)

let UIColorAppleBlue = UIColor(red: 0.0, green: 0.6133, blue: 0.8594, alpha: 1.0)
let UIColorAppleRed = UIColor(red: 0.875, green: 0.2266, blue: 0.2422, alpha: 1.0)
let UIColorAppleGreen = UIColor(red: 0.3828, green: 0.7305, blue: 0.2773, alpha: 1.0)
let UIColorApplePurple = UIColor(red: 0.5859, green: 0.2383, blue: 0.5898, alpha: 1.0)
let UIColorAppleOrange = UIColor(red: 0.9609, green: 0.5117, blue: 0.125, alpha: 1.0)

//let seatColor : UIColor = [

let gameColors :  [UIColor] = [UIColorAppleBlue, UIColorAppleRed, UIColorAppleGreen, UIColorApplePurple, UIColorAppleOrange]

//// Sound effects ///////////////////////////////
let SoundDing = "ding.mp3"
let SoundWrong = "wrong.m4a"
let SoundWin = "win.mp3"
let AudioEffectFiles = [SoundDing, SoundWrong, SoundWin]