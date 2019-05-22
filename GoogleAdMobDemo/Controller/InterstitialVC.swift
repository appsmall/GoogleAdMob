//
//  InterstitialVC.swift
//  GoogleAdMobDemo
//
//  Created by apple on 22/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//
// Interstitial ads are full-screen ads that cover the interface of an app until closed by the user.
// They're typically displayed at natural transition points in the flow of an app, such as between activities or during the pause between levels in a game. 

import UIKit
import GoogleMobileAds

class InterstitialVC: UIViewController {
    
    var interstitial: GADInterstitial?
    
    
    // MARK:- VIEW CONTROLLER LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Interstitial Example"
        
        // Instantiate GADInterstitial object
        interstitial = createAndLoadInterstitial()
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitialObject = GADInterstitial(adUnitID: AdMob.Development.interstitialAdUnitId)
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "447ba84519e18485b5928858d785ecd98d046b0d"]
        
        interstitialObject.delegate = self
        interstitialObject.load(request)
        return interstitialObject
    }
    
    
    // MARK:- IBACTIONS
    @IBAction func backBtnPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openInterstitialAdBtnPressed(_ sender: UIButton) {
        if interstitial!.isReady {
            interstitial?.present(fromRootViewController: self)
        }
        else {
            print("Ad wasn't ready")
        }
    }
}

// MARK:- GADInterstitialDelegate METHODS
extension InterstitialVC: GADInterstitialDelegate {
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
        interstitial = createAndLoadInterstitial()
    }
    
    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
}
