import UIKit
import UserNotifications
//import NotificationBannerSwift

open class AppDelegate: UIResponder, UIApplicationDelegate  {

    open var window: UIWindow?

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var rootViewController: UIViewController

        let storyboardName = "Main"
        let storyboardBundle = Bundle(for: AppDelegate.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        rootViewController = storyboard.instantiateViewController(withIdentifier: "main")

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        let notification = UILocalNotification()
        
        notification.fireDate = Date(timeIntervalSinceNow: 3)          // Sets the fire date
        notification.alertBody = "Enjoyed your lunch? Don't forget to track your expenses!"
        notification.alertAction = "Add expense"
        
        application.scheduleLocalNotification(notification)
 
        return true
    }

    open func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    private func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    private func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    private func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    private func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
//    open func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        print("Hello")
//    }
    
    open func application(_ application: UIApplication,
                     didReceive notification: UILocalNotification) {
//        let banner = NotificationBanner(title: notification.alertTitle, subtitle:  notification.alertBody, style: .success)
//        banner.show()
        //RCTPushNotificationManager.didReceive(notification)
    }
}

