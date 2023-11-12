//
//  List_View_cell.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

struct List_View_cell: View {
    @EnvironmentObject private var pathmodel : PathModel
    
    @EnvironmentObject private var list_view_viewmodel : List_View_ViewModel
    
    private var diary : Diary
    
    init(diary: Diary
    ) {
        self.diary = diary
    }
    
    var body: some View {
        
        
        ZStack{
//            Color.yellow
            Color.black
            Color.white
                .frame(width: UIScreen.main.bounds.width - 45, height: 315)
                .clipShape(.rect(cornerRadius: 12))
            
            
            VStack{
                HStack{
                    Text("\(diary.Title)")
                        .lineLimit(2)
                        .font(.system(size: 30, weight: .bold))
                    Spacer()
                    
                    Text("\(diary.converedDate(date: diary.Date))")
                        .font(.system(size: 30, weight: .medium))
                }
                .frame(height: 75)
                .padding()
                
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 70, height: 3)
                
                
                HStack{
                    
                    
                    
                    Rectangle()
//                        .frame(width: 100, height : 75)
                    
                    
                    Text(diary.Detail)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding()
            }
        }
        .shadow(radius: 15)
        .frame(width: UIScreen.main.bounds.width - 40, height: 320)
        .clipShape(.rect(cornerRadius: 12))
        
        
        
    }
}

#Preview {
    List_View_cell(diary: .init(Title: "", Date: Date(), Detail: ""))
}
