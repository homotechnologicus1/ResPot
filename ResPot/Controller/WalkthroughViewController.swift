//
//  WalkthroughViewController.swift
//  ResPot
//
//  Created by joe_mac on 01/05/2021.
//  Copyright © 2021 Joe K. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func skipButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                dismiss(animated: true, completion: nil)
                
            default: break
                
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        // Update UI buttons
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle(NSLocalizedString("NEXT", comment: "NEXT"), for: .normal)
                skipButton.isHidden = false
            case 2:
                nextButton.setTitle(NSLocalizedString("GET STARTED", comment: "GET STARTED"), for: .normal)
                skipButton.isHidden = true
            default: break
            }
            
            pageControl.currentPage = index
        }
        
    }
    
    // MARK: - WalkthroughPageViewControllerDelegate methods
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare(for:sender:) called")
        print(sender ?? "no sender")
        print(walkthroughPageViewController ?? "no walkthroughPageViewController")
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
            print(walkthroughPageViewController ?? "no walkthroughPageViewController")
        }
    }
    
}
