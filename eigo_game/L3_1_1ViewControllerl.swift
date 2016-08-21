import UIKit

class L3_1_1ViewController: UIViewController {
    
    var selectedRow:[String] = []

    @IBOutlet weak var English: UITextField!
    @IBOutlet weak var Japanese: UITextField!
    @IBOutlet weak var Type: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        English.text = selectedRow[0]
        Japanese.text = selectedRow[1]
        Type.text = selectedRow[2]

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}