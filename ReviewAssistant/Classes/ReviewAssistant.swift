//  Copyright © 2019 LVeecode All rights reserved.
//

import UIKit
import StoreKit

@objc public class ReviewAssistant: NSObject {
    
    enum DefaultsKey: String {
        case lastReviewRequestAppVersion
        case lastReviewRequestDate
        case appCrashedCooldownDate
    }
    
    
    /// Save the new cooldown date for a recent crash
    /// Any new review requests will only be done after this date
    ///
    /// - Parameter date: New crash cooldown date. Any new review requests will only be done after this date
    @objc public static func logCrashCooldownDate(_ date: Date) {
        UserDefaults.standard.set(date, forKey: DefaultsKey.appCrashedCooldownDate.rawValue)
    }
    
    /// Request review if:
    /// Has not requested for this app version
    /// Has not requested review today
    /// Has not crashed "recently" as defined by crash cooldown date
    ///
    /// - Returns: Returns true if requested review, false if did not. Use this to reset your review worthy actions
    @objc public static func requestReviewIfAppropriate() -> Bool {
        
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        // Get last review request date and version from defaults
        let lastVersion = UserDefaults.standard.string(forKey: DefaultsKey.lastReviewRequestAppVersion.rawValue) ?? ""
        let lastReviewDate = UserDefaults.standard.object(forKey: DefaultsKey.lastReviewRequestDate.rawValue) as? Date ?? Date.init(timeIntervalSince1970: 0)
        
        // Determine if shouldn't display review because app crashed recently
        let crashCooldownDate = UserDefaults.standard.object(forKey: DefaultsKey.appCrashedCooldownDate.rawValue) as? Date
        var appCrashedRecently = crashCooldownDate != nil
        if appCrashedRecently {
            let diff = Calendar.current.dateComponents([.day], from: Date(), to: crashCooldownDate!)
            appCrashedRecently = diff.day ?? 0 > 0
        }
        
        
        if (appCrashedRecently ||
            lastVersion == currentVersion ||
            Calendar.current.isDate(Date(), inSameDayAs:lastReviewDate)) {
            
            return false
        }
        
        // If user has completed enough review-worthy actions
        // and weren't asked to review this version, ask to review
        SKStoreReviewController.requestReview()
        
        // Resetting review-worthy actions
        UserDefaults.standard.set(currentVersion, forKey: DefaultsKey.lastReviewRequestAppVersion.rawValue)
        UserDefaults.standard.set(Date(), forKey: DefaultsKey.lastReviewRequestDate.rawValue)
        
        return true
    }
    
    
    /// Direct user to the App Store app with review page opened
    /// for your app. Use this method to manually request review after a user
    /// action, such as tapping a button that says "rate the app"
    ///
    /// - Parameter appId: Your app's App Store ID as seen on App Store Connect
    @objc public static func manuallyOpenRateApp(withAppId appId: String) {
        let rateString = "itms-apps://itunes.apple.com/app/id" + appId + "?mt=8&action=write-review"
        
        if let url = URL(string: rateString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
