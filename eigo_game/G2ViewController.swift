//
//  ViewController.swift
//  eigo_game
//
//  Created by ohtori on 2016/05/31.
//  Copyright © 2016年 ohtori. All rights reserved.
//

import UIKit
import AVFoundation

class G2ViewController: UIViewController, AVAudioPlayerDelegate {

    var grade_list:[[String]] = []
    var grade: Int = 1
    var current_question: Int = 0
    var passed_question: [Int] = []
    var other_question: [Int] = []
    var missed_question: [[String]] = []
    var selected_num: Int = -1
    var total_question_num: Int = 0
    var total_correct_num: Int = 0
    var total_wrong_num: Int = 0
    var score: Int = 0
    var succession_num: Int = 0
    var tmp: Int = 0
    
    var audioPlayer1 :AVAudioPlayer!
    var audioPlayer2 :AVAudioPlayer!

    
    @IBOutlet weak var QuestionWord: UILabel!
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var InARow: UILabel!
    @IBOutlet weak var MissNum: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grade_list = Library.sharedLibrary.getListByGrade(grade)
        
        Result.hidden = true;
        getQuestions()

        // for audito play
        let audioPath1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct2", ofType: "mp3")!)
        let audioPath2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("incorrect2", ofType: "mp3")!)

        
        // auido を再生するプレイヤーを作成する
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOfURL: audioPath1)
            audioPlayer2 = try AVAudioPlayer(contentsOfURL: audioPath2)

            
        } catch {
            // プレイヤー作成失敗
            // その場合は、プレイヤーをnilとする
            audioPlayer1 = nil
            audioPlayer2 = nil

        }
    
        audioPlayer1.delegate = self
        audioPlayer2.delegate = self
        audioPlayer1.prepareToPlay()
        audioPlayer2.prepareToPlay()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getCurrentQuestion() {
        
        let i = 0
        while (i<1) {
            current_question = getQuestionId(grade_list.count)
            if(passed_question.indexOf(current_question) == nil){
                break;
            }
        }
    }
    
    func getOtherQuestion() {
        
        if(other_question.count > 3){
            other_question = []
        }
        
        var x: Int = 0
        
        var i = 0
        while (i<3) {
            x = Library.sharedLibrary.getRandomNum(grade_list.count)
            if(current_question != x){
                if(other_question.indexOf(x) == nil) {
                    other_question.append(x)
                    i += 1
                }
            }
        }
    }
    
    func getQuestionId(max_num: Int) -> Int {
        return Library.sharedLibrary.getRandomNum(max_num)
    }
    
    
    @IBAction func buttonClick(sender: UIButton) {
        selected_num = sender.tag
        
        if(selected_num == current_question) {
            total_correct_num += 1
            succession_num += 1
            
            Result.text = "correct"
            Result.hidden = false
            
            InARow.text = String(succession_num)
            
            // populate score
            switch succession_num {
            case (0...10):
                score += 10
            case (11...20):
                score += 20
            case (21...30):
                score += 30
            case (31...40):
                score += 40
            case (41...50):
                score += 50
            case (51...1000):
                score += 60
            default:
                break // do nothing
            }
            
            audioPlayer1.play()
            
        }else {
            total_wrong_num += 1
            succession_num = 0
            
            Result.text = "wrong: " + grade_list[other_question[0]][1]
            Result.hidden = false
            
            MissNum.text = String(total_wrong_num)
            InARow.text = String(succession_num)
            
            missed_question.append(grade_list[current_question])
            
            audioPlayer2.play()

        }
        
        passed_question.append(current_question)
        total_question_num += 1
        
        if(total_wrong_num > 4){
            gameOver()
        }
        
        getQuestions()
    }
    
    func getQuestions() {
        
        getCurrentQuestion()
        getOtherQuestion()
        
        other_question.append(current_question)
        
        tmp = Library.sharedLibrary.getRandomNum(2)
        if(tmp > 0) {
            other_question.sortInPlace(){ $0 < $1 }
        }else{
            other_question.sortInPlace(){ $1 < $0 }
        }
        
        
        Button1.setTitle(grade_list[other_question[0]][1], forState: .Normal)
        Button2.setTitle(grade_list[other_question[1]][1], forState: .Normal)
        Button3.setTitle(grade_list[other_question[2]][1], forState: .Normal)
        Button4.setTitle(grade_list[other_question[3]][1], forState: .Normal)
        
        Button1.tag = other_question[0]
        Button2.tag = other_question[1]
        Button3.tag = other_question[2]
        Button4.tag = other_question[3]
        
        QuestionWord.text = grade_list[current_question][0]
    }

    func gameOver(){
        performSegueWithIdentifier("toG3ViewController",sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toG3ViewController") {
            let Segue: G3ViewController = (segue.destinationViewController as? G3ViewController)!
            Segue.missed_question = missed_question
            Segue.total_correct_num = total_correct_num
            Segue.score = score
        }
    }
    
}

