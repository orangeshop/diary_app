//
//  List_View_Cell_ViewModel.swift
//  diary_app
//
//  Created by 최영호 on 11/8/23.
//

import Foundation

class List_View_Cell_ViewModel : ObservableObject{
    @Published var title : String
    @Published var date : Date
    @Published var detail : String
    
    
    
    init(title: String = "",
         date: Date = Date(),
         detail: String = ""
    ) {
        self.title = title
        self.date = date
        self.detail = detail
    }
    
    
}
