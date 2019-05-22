//
//  NativeAdsVC.swift
//  GoogleAdMobDemo
//
//  Created by apple on 22/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//
// USED FOR SHOWING ADS INTO OUR CUSTOM VIEW

import UIKit
import GoogleMobileAds


class NativeAdsVC: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    var adLoader: GADAdLoader?
    
    
    // MARK:- VIEW CONTROLLER LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Native Ads"
        
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 5
        
        adLoader = GADAdLoader(adUnitID: AdMob.Development.nativeAdUnitId, rootViewController: self, adTypes: [GADAdLoaderAdType.unifiedNative], options: [multipleAdsOptions])
        adLoader?.delegate = self
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "447ba84519e18485b5928858d785ecd98d046b0d"]
        adLoader!.load(request)
    }
}


// MARK:- GADUnifiedNativeAdLoaderDelegate METHODS
extension NativeAdsVC: GADUnifiedNativeAdLoaderDelegate {
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
        print("adLoaderDidReceive")
        
        label1.text = nativeAd.advertiser
        label2.text = nativeAd.body
        label3.text = nativeAd.headline
        
        print(nativeAd.advertiser)
        print(nativeAd.body)
        print(nativeAd.extraAssets)
        print(nativeAd.headline)
        print(nativeAd.icon)
        print(nativeAd.price)
        print(nativeAd.starRating)
        print(nativeAd.store)
    }
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {
        print("adDidFailToReceiveAdWithError")
    }
    
    func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        print("adLoaderDidFinishLoading")
    }
}
