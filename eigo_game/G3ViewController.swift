//
//  G3ViewController.swift
//  eigo_game
//
//  Created by ohtori on 2016/06/12.
//  Copyright © 2016年 ohtori. All rights reserved.
//

import UIKit

class G3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var missed_question: [[String]] = []
    var missed_list: [[String]] = []
    var total_correct_num: Int = 0
    var score: String = ""
    
    @IBOutlet weak var G3TableView: UITableView!
    @IBOutlet weak var G3Score: UILabel!
    @IBOutlet weak var G3BackToG1Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        G3TableView.delegate = self
        G3TableView.dataSource = self
        
        score = String(total_correct_num * 10)
        G3Score.text = score
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missed_question.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        
        cell.textLabel?.text = missed_question[indexPath.row][0]
        cell.detailTextLabel?.text = missed_question[indexPath.row][1]
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }

    @IBAction func backToG1Button(sender: AnyObject) {
        performSegueWithIdentifier("backToG1Controller",sender: nil)
    }

}
