//
//  ViewController.swift
//  Parkinsons
//
//  Created by Rishi Salwi on 10/21/16.
//  Copyright © 2016 Rishi Salwi. All rights reserved.
//

import UIKit	import CoreMotion
class ViewController: UIViewController {
    let manager = CMMotionManager() //Motion manager is used for four types of motion: accelerometer, gyro, magnetometer, and device motion
    
    @IBOutlet weak var Block: UIImageView!//
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        manager.deviceMotionUpdateInterval=0.01
        
        if manager.isDeviceMotionAvailable{
            
            manager.accelerometerUpdateInterval = 0.01 //set interval for updates to the manager
            
            manager.startDeviceMotionUpdates(to: NSOperationQueue.main)  {data,error in //pushes data to the manager
                
                if (data?.gravity) != nil {//makes sure data is veing pushed
                    let xtilt=data?.gravity.x//get raw x data values
                    let xtilt1=xtilt!//take out optional state
                    let ytilt=data?.gravity.y//get raw y data values
                    let ytilt1=ytilt!//take out optional state
                    let prerotation=atan2(xtilt1, ytilt1)//use the tangent function
                    let rotation = prerotation - M_PI//subtract pi
                    let postrotation=CGFloat(rotation)//convert to float
                    
                    
                    self.Block.transform = CGAffineTransform(rotationAngle: postrotation)
                }
            }
        }
        else {
            manager.stopAccelerometerUpdates()
        }}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
