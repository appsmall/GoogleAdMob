//
//  ViewController.swift
//  GoogleAdMobDemo
//
//  Created by apple on 22/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    struct Storyboard {
        static let ViewControllerToBannerVC = "ViewControllerToBannerVC"
        static let ViewControllerToInterstitialVC = "ViewControllerToInterstitialVC"
        static let ViewControllerToRewardVideoAdVC = "ViewControllerToRewardVideoAdVC"
        static let ViewControllerToNativeAdsVC = "ViewControllerToNativeAdsVC"
    }
    
    
    // MARK:- VIEW CONTROLLER LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK:- IBACTIONS
    @IBAction func bannerAdsBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Storyboard.ViewControllerToBannerVC, sender: nil)
    }
    
    @IBAction func interstitialBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Storyboard.ViewControllerToInterstitialVC, sender: nil)
    }
    @IBAction func rewardVideoAdBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: Storyboard.ViewControllerToRewardVideoAdVC, sender: nil)
    }
    
    @IBAction func nativeAdsBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Storyboard.ViewControllerToNativeAdsVC, sender: nil)
    }
}



