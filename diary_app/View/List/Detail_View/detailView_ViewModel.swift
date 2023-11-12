//
//  detailView_ViewModel.swift
//  diary_app
//
//  Created by 최영호 on 11/12/23.
//

import Foundation

class detailView_ViewModel: ObservableObject{
    
    
    @Published var detail_diary : [Diary]
    
    @Published var title : String
    
    init(detail_diary: [Diary] = [],
         title : String = ""
    ) {
        self.detail_diary = detail_diary
        self.title = title
    }
    
    func title_temp(_ Title : String){
        title = Title
    }
    
    func addDiary(_ diray: Diary){
        detail_diary.append(diray)
    }
}
