import UIKit

class HomeViewController: UIViewController {
    @IBAction
    func onViewMessagesPress(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("ButtonPress"), object: { () -> () in
            print("Legacy behavior!")
        })
    }
    
    @IBAction
    func onSendMessagePress(_ sender: Any) {
        let notification = UILocalNotification()
        
        notification.fireDate = Date(timeIntervalSinceNow: 3)
        notification.alertBody = "Enjoyed your lunch? Don't forget to track your expenses!"
        notification.alertAction = "Add expense"
        
        UIApplication.shared.scheduleLocalNotification(notification)
    }
}

