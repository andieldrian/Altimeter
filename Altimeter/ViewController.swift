//
//  ViewController.swift
//  Altimeter
//
//  Created by Andi Ikhsan Eldrian on 09/07/19.
//  Copyright © 2019 Andi Ikhsan Eldrian. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var relativeAltitude: UILabel!
    
    
    let altimeter = CMAltimeter()
    
    @IBAction func startButton(_ sender: Any) {
        startAltimeter()
    }
    @IBAction func stopButton(_ sender: Any) {
        altimeter.stopRelativeAltitudeUpdates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func startAltimeter() {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { (data, error) in
                self.relativeAltitude.text = data?.relativeAltitude.stringValue
//                self.pressure.text = data?.pressure.stringValue
            }
        }
    }


}

