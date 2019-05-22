//
//  RewardVideoVC.swift
//  GoogleAdMobDemo
//
//  Created by apple on 22/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//
// Rewarded video ads are full-screen video ads that users have the option of watching in full in exchange for in-app rewards.

import UIKit
import GoogleMobileAds

class RewardVideoVC: UIViewController {

    
    // MARK:- VIEW CONTROLLER LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Rewarded Video Ads"
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        setupRewardedVideoRequest()
    }
    
    fileprivate func setupRewardedVideoRequest() {
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: AdMob.Development.rewardedVideoAdUnitId)
    }
    
    
    // MARK:- IBACTIONS
    @IBAction func openRewardVideoAdsBtnPressed(_ sender: UIButton) {
        if GADRewardBasedVideoAd.sharedInstance().isReady {
           GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
        else {
            print("Reward based video not ready")
        }
    }
}

// MARK:- GADRewardBasedVideoAdDelegate METHODS
extension RewardVideoVC: GADRewardBasedVideoAdDelegate {
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad has completed.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        setupRewardedVideoRequest()
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }
}
