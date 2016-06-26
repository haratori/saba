//
//  G1ViewController.swift
//  eigo_game
//
//  Created by ohtori on 2016/06/19.
//  Copyright © 2016年 ohtori. All rights reserved.
//

import UIKit

class G1ViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var LevelPicker: UIPickerView!
    
    var levels = ["level1", "level2", "level3", "level4", "level5", "level6"]
    var selected_level:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.LevelPicker.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return levels.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
        return "\(levels[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected_level = row + 1
    }
    
    @IBAction func clickStart(sender: AnyObject) {
        performSegueWithIdentifier("toG2ViewController", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toG2ViewController") {
            let Segue: G2ViewController = (segue.destinationViewController as? G2ViewController)!
            
            if(selected_level == 0 ){
                selected_level = 1
            }
            
            Segue.grade = selected_level
        }
    }
    
}