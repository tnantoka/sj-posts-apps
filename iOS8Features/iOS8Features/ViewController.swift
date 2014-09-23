//
//  ViewController.swift
//  iOS8Features
//
//  Created by Tatsuya Tobioka on 9/23/14.
//  Copyright (c) 2014 tnantoka. All rights reserved.
//

import SpriteKit

class ViewController: UIViewController {

    override func loadView() {
        let applicationFrame = UIScreen.mainScreen().bounds
        let skView = SKView(frame: applicationFrame)
        self.view = skView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view.
        let skView = self.view as SKView
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsDrawCount = true
        skView.showsPhysics = true
        skView.showsFields = true
        skView.showsQuadCount = true

        skView.ignoresSiblingOrder = true
        
        let scene = FeaturesScene(size: self.view.bounds.size)
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

