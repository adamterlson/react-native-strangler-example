import UIKit
import LegacyFramework
import UserNotifications

@UIApplicationMain
// Extend from the Legacy's AppDelegate
class AppDelegate: LegacyFramework.AppDelegate {
  var facade: Facade!
  // Override methods only when they become relevant
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    Facade.sharedInstance.window = window
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
//  override func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
//    RCTPushNotificationManager.didReceive(notification)
//  }
}
