//
//  List_View_VIewModel.swift
//  diary_app
//
//  Created by 최영호 on 11/8/23.
//

import Foundation

class List_View_ViewModel : ObservableObject{
    @Published var diarys : [Diary]
    
    init(diarys : [Diary] = [
        
    ]){
        self.diarys = diarys
    }
    
    func coredata_append_arr(title : String, detail : String, date : Date){
        diarys.append(Diary(Title: title, Date: date, Detail: detail))
    }
    
    func addDiary(_ diray: Diary){
        diarys.append(diray)
    }
    
    func correctionDiary(_ diray: Diary, num : Int){
//        print("write view idx \(num)")
//        print(diray)
        
        diarys[num] = diray
        
    }
    
    
    func idxDiary(_ diary: Diary) -> Int{
        for i in 0 ..< diarys.count{
            if(diary == diarys[i]){
                return i
            }
        }
        return -1
    }
    
    func deleteDiary(_ idx: Int){
        diarys.remove(at: idx)
    }
}

