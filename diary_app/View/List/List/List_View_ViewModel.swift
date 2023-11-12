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
        .init(Title: "공부는 항상 하기 싫어", Date: Date(), Detail: "공부는 재미없어")
    ]){
        self.diarys = diarys
    }
    
    func addDiary(_ diray: Diary){
        diarys.append(diray)
    }
}
