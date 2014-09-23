//
//  FeaturesScene.swift
//  iOS8Features
//
//  Created by Tatsuya Tobioka on 9/23/14.
//  Copyright (c) 2014 tnantoka. All rights reserved.
//

import SpriteKit

class FeaturesScene: SKScene {

    var contentCreated = false

    enum Category: UInt32 {
        case Light = 1
    }
    
    override func didMoveToView(view: SKView) {
        self.scaleMode = .AspectFit
        
        self.createSceneContents()
    }
    
    func createSceneContents() {
        if self.contentCreated {
            return
        }
        
        self.backgroundColor = SKColor.lightGrayColor()
        
        // showPhysics
        let spriteNode = SKSpriteNode(color: SKColor.grayColor(), size: CGSize(width: 50.0, height: 50.0))
        spriteNode.position = CGPoint(x: 50.0, y: 50.0)
        spriteNode.physicsBody = SKPhysicsBody(rectangleOfSize: spriteNode.size)
        spriteNode.physicsBody?.affectedByGravity = false
        self.addChild(spriteNode)
 
        // SKFieldNode
        let boxNode = SKSpriteNode(color: SKColor.orangeColor(), size: CGSize(width: 50.0, height: 50.0))
        boxNode.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        boxNode.lightingBitMask = Category.Light.toRaw()
        self.addChild(boxNode)

        var path = CGPathCreateMutable()
        CGPathCreateWithEllipseInRect(CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0), nil)
        CGPathAddArc(path, nil, 0.0, 0.0, 10.0, 0, CGFloat(M_PI * 2.0), true)
        let circleNode = SKShapeNode(path: path)
        circleNode.position = CGPoint(x: CGRectGetMidX(self.frame) - 100.0, y: CGRectGetMidY(self.frame) + 100.0)
        circleNode.fillColor = SKColor.blueColor()
        circleNode.physicsBody = SKPhysicsBody(circleOfRadius: 10.0)
        circleNode.physicsBody?.affectedByGravity = false
        self.addChild(circleNode)
        
        let fieldNode = SKFieldNode.springField()
        fieldNode.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        fieldNode.strength = 0.4
        self.addChild(fieldNode)

        // SKLightNode
        let lightNode = SKLightNode()
        lightNode.position = CGPoint(x: CGRectGetMidX(self.frame) + 100.0, y: CGRectGetMidY(self.frame) + 100.0)
        lightNode.categoryBitMask = Category.Light.toRaw()
        self.addChild(lightNode)
        
        self.contentCreated = true
    }
}
