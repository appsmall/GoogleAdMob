//
//  BannerVC.swift
//  GoogleAdMobDemo
//
//  Created by apple on 22/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//
// Banner ads are rectangular image or text ads that occupy a spot within an app's layout.
// They stay on screen while users are interacting with the app, and can refresh automatically after a certain period of time. 

import UIKit
import GoogleMobileAds


class BannerVC: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    
    
    // MARK:- VIEW CONTROLLER LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Banner Example"

        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "447ba84519e18485b5928858d785ecd98d046b0d"]
        //request.contentURL = "https://www.facebook.com"
        //GADMobileAds.sharedInstance().requestConfiguration.tag(forChildDirectedTreatment: true)
        
        bannerView.delegate = self
        bannerView.adUnitID = AdMob.Development.bannerAdUnitId
        bannerView.adSize = kGADAdSizeBanner
        bannerView.rootViewController = self
        bannerView.load(request)
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}


// MARK:- GADBannerViewDelegate METHODS
extension BannerVC: GADBannerViewDelegate {
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}
