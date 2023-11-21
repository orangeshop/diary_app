//
//  List_View.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

struct List_View: View {
    @EnvironmentObject private var pathmodel : PathModel
    @EnvironmentObject private var list_view_viewmodel:List_View_ViewModel
    @EnvironmentObject private var detailview_viewmodel : detailView_ViewModel
    @State var now_drag : Bool = false
    @State var currentIndex : Int = 0
    @State var padding_drag : CGSize = CGSize.zero
    
    let numberOfItems : Int = 5
    
    var body: some View {
        
        if list_view_viewmodel.diarys.isEmpty{
            
            VStack{
                Text("빈 페이지")
            }
        }
        else{
            ScrollView{
                
                VStack(alignment: .center, spacing: 10){
                    ForEach(list_view_viewmodel.diarys, id: \.self){diary in
                        
                        List_View_cell(diary : diary)
                        
                    }
                }
                .padding(.vertical, now_drag ? padding_drag.height : 0)
                .offset(y : CGFloat(currentIndex * 330))
            }
            .scrollDisabled(false)
        }
    }
}



#Preview {
    List_View()
}
