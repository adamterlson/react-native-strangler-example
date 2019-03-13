import UIKit

class HomeViewController: UIViewController {
    @IBAction
    func onViewMessagesPress(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("ButtonPress"), object: { () -> () in
            print("Legacy behavior!")
        })
    }
}

