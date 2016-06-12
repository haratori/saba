//
//  library.swift
//  eigo
//
//  Created by ohtori on 2016/03/30.
//  Copyright (c) 2016年 ohtori. All rights reserved.
//

import Foundation

class Library {
    
    // Singleton Obj
    static let sharedLibrary = Library()
    var grade_list: [[String]] = []
    
    func getListByGrade(grade: Int) -> [[String]] {
        
        var filtered_grade_list: [[String]] = []
        
        if self.grade_list.isEmpty {
            
            let filepath = NSBundle.mainBundle().pathForResource("a", ofType: "csv")
            let data = (try! NSString(contentsOfFile: filepath!, encoding: NSUTF8StringEncoding)) as String
            
            data.enumerateLines { (line, stop) -> () in
                let item: [String] = line.characters.split(allowEmptySlices: true, isSeparator: { $0 == "," } ).map { String($0) }
                self.grade_list.append(item)
            }
        }
        
        for x in self.grade_list {
            if Int(x[3]) == grade {
                filtered_grade_list.append(x)
            }
        }
        
        return filtered_grade_list
    }
    
    func getRandomNum(max_num: Int) -> Int {
        
        return Int(arc4random_uniform(UInt32(max_num)))
    }
    
}