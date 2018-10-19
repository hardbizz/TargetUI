//
//  ViewController.swift
//  GoalUI
//
//  Created by MacBook on 19.10.2018.
//  Copyright © 2018 Bizz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           targetUI(5)
        // drawBox(314, 50, 291)
    }
    
    func drawBox(_ size:Int, _ x:Int, _ y:Int) {
        //var x = 80
        //let y = 500
        let cube = CGRect.init(x: x, y: y, width: size, height: size)
        let box = UIView(frame: cube)
        box.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                      green: CGFloat(arc4random_uniform(256))/255,
                                      blue: CGFloat(arc4random_uniform(256))/255,
                                      alpha: 1)
        view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                       green: CGFloat(arc4random_uniform(256))/255,
                                       blue: CGFloat(arc4random_uniform(256))/255,
                                       alpha: 1)
        view.addSubview(box)
    }
    
    func targetUI(_ count: Int) {
        var size = 314
        var x = 50
        var y = 291
        //let n = Double(count)
        let shift = 157 / count
        var movingToCenter = 157
        while movingToCenter > 0 {
            drawBox(size, x, y)
            size-=2*shift
            x+=shift
            y+=shift
            movingToCenter-=shift
        }
    }
    
    
    
}



