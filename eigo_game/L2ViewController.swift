import UIKit

class L2ViewController: UIViewController {

    var selectedRow:[String] = []

    @IBOutlet weak var L2EnglishLabel: UILabel!
    @IBOutlet weak var L2JapaneseLabel: UILabel!
    @IBOutlet weak var L2TypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        L2EnglishLabel.text = selectedRow[0]
        L2JapaneseLabel.text = selectedRow[1]
        L2TypeLabel.text = selectedRow[2]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}