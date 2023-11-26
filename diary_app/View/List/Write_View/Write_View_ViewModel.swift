//
//  Write_View_ViewModel.swift
//  diary_app
//
//  Created by 최영호 on 11/11/23.
//

import Foundation

class Write_View_ViewModel : ObservableObject{
    
    @Published var title : String
    @Published var day : Date
    @Published var detail : String
    
    @Published var mode : Bool
    @Published var idx: Int
    @Published var temp_title : String
    @Published var temp_detail : String
    
    init(title: String = "",
         day: Date = Date(),
         detail: String = "",
         mode : Bool = false,
         idx : Int = -1,
         temp_title : String = "",
         temp_detail : String = ""
         
    ) {
        self.title = title
        self.day = day
        self.detail = detail
        self.mode = mode
        self.idx = idx
        self.temp_title = temp_title
        self.temp_detail = temp_detail
    }
    
    
   
    
    func change_mode(num : Int, diary : [Diary]){
//        mode.toggle()
        if(num == -1){
            mode = false
            idx = -1
            title = ""
            detail = ""
            temp_detail = ""
            temp_title = ""
            return
        }
        idx = num
//        let _ = print(List_View_ViewModel().diarys)
//        let _ = print(idx)
//        
        for i in 0 ..< diary.count{
            print("\(i) : \(diary[i])")
        }
//        
        temp_title = diary[idx].Title
        temp_detail = diary[idx].Detail
    }
    
}
