//
//  Screen.swift
//  obligatorio2
//
//  Created by JuanPablo on 6/3/17.
//  Copyright © 2017 UCUDAL. All rights reserved.
//

import UIKit
class Screen {
    static let shared = Screen()
    private init(){
        let screenSize = UIScreen.main.bounds
        let originalWidth:CGFloat = 375.0 //iphone 7 sizes
        let originalHeigth:CGFloat = 667.0
        self.width = screenSize.width
        self.height = screenSize.height
        self.internalRelationWidth = screenWidth/originalWidth
        self.internalRelationHeight = screenHeight/originalHeigth

    }
    
    private var width:CGFloat!
    var screenWidth:CGFloat
    {get {
        return width
        }
    }
    private var height:CGFloat!
    var screenHeight:CGFloat
    {get {
        return height
        }
    }
    private var internalRelationWidth:CGFloat!
    var relationWidth:CGFloat
    {get {
        return internalRelationWidth
        }
    }
    private var internalRelationHeight:CGFloat!
    var relationHeight:CGFloat
    {get {
        return internalRelationHeight
        }
    }
    
    private let internalSmallBigFontTemperatureRelation:CGFloat=40/62
    var smallBigFontTemperatureRelation:CGFloat{get{
        return internalSmallBigFontTemperatureRelation}
    }
    
    private let internalIphone4sScreenHeight:CGFloat=480
    var iphone4sScreenHeight:CGFloat{get{
        return internalIphone4sScreenHeight}
    }
    
}
