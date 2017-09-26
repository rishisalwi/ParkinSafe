//
//  Block.swift
//  Parkinsons
//
//  Created by Rishi Salwi on 10/21/16.
//  Copyright © 2016 Rishi Salwi. All rights reserved.
//

import UIKit

import CoreMotion
let manager = CMMotionManager()
class Block: UIImageView {
    func viewDidLoad() {
        print(manager.isAccelerometerAvailable)
        if manager.isAccelerometerAvailable {
            manager.accelerometerUpdateInterval = 0.01
            manager.startAccelerometerUpdates(to: OperationQueue.main)  {data,error in
                if let acceleration = data?.acceleration {
                    let rotation = atan2(acceleration.x, acceleration.y) - M_PI
                    print(acceleration.x)
                    self.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
                }
            }
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
