//
//  List_view_Model.swift
//  diary_app
//
//  Created by 최영호 on 11/8/23.
//

import Foundation

struct Diary: Hashable{
    let Title : String
    let Date : Date
    let Detail : String
    
    
    func converedDate(date : Date) -> String{
        var test = date
        
        var str : String = "\(test)"
        
        print(str.split(separator: " ")[0].split(separator: "-"))
        var month = str.split(separator: " ")[0].split(separator: "-")[1]
        var day = str.split(separator: " ")[0].split(separator: "-")[2]
        
        
        return "\(month)/\(day)"
    }
    
}
