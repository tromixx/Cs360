//FirstVC
import UIKit

class firstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
//LastVC
import UIKit

class lastVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
//MiddleVc
import UIKit

class MiddleVC: UIViewController {

    @IBOutlet weak var mlabel: UILabel!
    
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let actualText = mlabel.text {
            mlabel.text = "\(actualText)\nEvent number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let actualText = mlabel.text {
            mlabel.text = "\(actualText)\nEvent number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let actualText = mlabel.text {
            mlabel.text = "\(actualText)\nEvent number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let actualText = mlabel.text {
            mlabel.text = "\(actualText)\nEvent number \(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let actualText = mlabel.text {
            mlabel.text = "\(actualText)\nEvent number \(eventNumber) was viewDidDisappear"
            eventNumber += 1
        }
    }

}
