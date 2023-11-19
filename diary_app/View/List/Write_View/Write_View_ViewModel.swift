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
    
    
    
    
    
    init(title: String = "",
         day: Date = Date(),
         detail: String = ""
    ) {
        self.title = title
        self.day = day
        self.detail = detail
    }
    
    
    
    
}
