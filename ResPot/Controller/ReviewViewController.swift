//
//  ReviewViewController.swift
//  ResPot
//
//  Created by joe_mac on 12/24/2020.
//  Copyright © 2020 Joe K. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var rateButtons: [UIButton]!
    
    // Exercise #1
    @IBOutlet var closeButton: UIButton!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        /*
        let moveRightTransform = CGAffineTransform(translationX: 600, y: 0)
         
        for rateButton in rateButtons {
            rateButton.transform = moveRightTransform
            rateButton.alpha = 0
        }   */
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // Make the button invisible and move off the screen
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        // Exercise #1
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -800)
        closeButton.transform = moveUpTransform
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*
        UIView.animate(withDuration: 2.0) {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[4].alpha = 1.0
        }   */
        
        /*
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        }, completion: nil)

        UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity
        }, completion: nil)

        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
        }, completion: nil)

        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity
        }, completion: nil)

        UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
            self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
        }, completion: nil) */
        
        // Exercise #2
        for (index, rateButton) in rateButtons.enumerated() {
            UIView.animateKeyframes(withDuration: 0.4, delay: 0.1 + 0.05 * Double(index), options: [], animations: {
                rateButton.alpha = 1.0
                rateButton.transform = .identity
            }, completion: nil)
        }
        
        /*
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        }, completion: nil) */

        // Exercise #1
        UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations: {
            self.closeButton.transform = .identity
        }, completion: nil)
    }

}
