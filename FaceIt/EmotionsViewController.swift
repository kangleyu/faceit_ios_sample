//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Tom Yu on 6/16/16.
//  Copyright © 2016 kangleyu. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    
    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "angry": FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried": FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
        "mischievious": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin),
    ];

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVC = segue.destinationViewController;
        if let navcon = destinationVC as? UINavigationController {
            destinationVC = navcon.visibleViewController ?? destinationVC;
        }
        if let facevc = destinationVC as? FaceViewController {
            if let identifier = segue.identifier {
                if let expression = emotionalFaces[identifier] {
                    facevc.expression = expression;
                    if let emotionButton = sender as? UIButton {
                        facevc.navigationItem.title = emotionButton.currentTitle;
                    }
                }
            }
        }
    }
    
    let instance = getFaceMVCinstanceCount()

}
