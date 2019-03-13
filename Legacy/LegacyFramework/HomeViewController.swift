import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup
    }

    @IBAction
    func onLoginPress(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("ButtonPress"), object: { () -> () in
            print("Legacy behavior!")
        })
    }
}

