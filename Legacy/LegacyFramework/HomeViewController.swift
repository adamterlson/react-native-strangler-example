import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onLoginPress(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("GreenField"), object: { () -> () in
            print("hello")
        })
    }
}

