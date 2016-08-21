import UIKit

class L3_1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var text: UILabel!

    //テーブルビューインスタンス作成
    var tableView: UITableView  =   UITableView()
    
//    @IBOutlet weak var tableView1: UITableView!
    var selectedRow: [String] = []
    var grade_list: [[String]] = []
    //学年選択変数(初期値＝1 中学一年生、1〜6：中１〜高3)
    var grade: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.blueColor()
        //テーブルビュー初期化、関連付け
        grade_list = Library.sharedLibrary.getListByGrade(grade)
        tableView.frame         =   CGRectMake(0, 0, 320, 200);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    
        
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
        cell.textLabel?.textColor = UIColor.blackColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedRow = grade_list[indexPath.row]
        
        performSegueWithIdentifier("toL3_1_1ViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toL3_1_1ViewController") {
            let Segue: L3_1_1ViewController = (segue.destinationViewController as? L3_1_1ViewController)!
            Segue.selectedRow = selectedRow
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}