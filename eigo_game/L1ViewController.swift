import UIKit

class L1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var L1tableView: UITableView!
    var selectedRow: [String] = []
    var grade_list: [[String]] = []
    var grade: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grade_list = Library.sharedLibrary.getListByGrade(grade)
        
        L1tableView.delegate = self
        L1tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grade_list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        var eng_list:[String] = []
        for x in grade_list {
            eng_list.append(x[0])
        }
        
        cell.textLabel?.text = eng_list[indexPath.row]
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        
        return cell
    }
    
    //func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    //    selectedRow = grade_list[indexPath.row]
        
    //    performSegueWithIdentifier("toSegue2", sender: nil)
    //}
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //    if(segue.identifier == "toSegue2") {
    //        let Segue: Segue1 = (segue.destinationViewController as? Segue1)!
    //        Segue.selectedRow = selectedRow
    //    }
    //}
    
    
}