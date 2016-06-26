//
//  BlinkingFaceViewController.swift
//  FaceIt
//
//  Created by Tom Yu on 6/26/16.
//  Copyright © 2016 kangleyu. All rights reserved.
//

import UIKit

class BlinkingFaceViewController: FaceViewController {

    var blinking: Bool = false {
        didSet {
            startBlink()
        }
    }
    
    private struct BlinkRate {
        static let ClosedDuration = 0.4
        static let OpenDuration = 2.5
    }
    
    func startBlink() {
        if blinking {
            faceView.eyesOpen = false
            NSTimer.scheduledTimerWithTimeInterval(
                BlinkRate.ClosedDuration,
                target: self,
                selector: #selector(BlinkingFaceViewController.endBlink),
                userInfo: nil,
                repeats: false)
        }
    }
    
    func endBlink() {
        faceView.eyesOpen = true
        NSTimer.scheduledTimerWithTimeInterval(
            BlinkRate.OpenDuration,
            target: self,
            selector: #selector(BlinkingFaceViewController.startBlink),
            userInfo: nil,
            repeats: false)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        blinking = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        blinking = false
    }
}
