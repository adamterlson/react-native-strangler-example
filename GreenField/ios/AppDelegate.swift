import UIKit
import LegacyFramework
import UserNotifications

@UIApplicationMain
// Extend from the Legacy's AppDelegate
class AppDelegate: LegacyFramework.AppDelegate {
  var launchGreenField: LaunchGreenField!
  // Override methods only when they become relevant
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    launchGreenField = LaunchGreenField(self.window!)
    
      // Use a "Facade" to determine request handler
      if Facade.isAppUser() {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      } else {
        launchGreenField.launch()
        return true
      }
  }
  
  override func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    RCTPushNotificationManager.didReceive(notification)
  }
}
