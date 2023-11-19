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
        
        
//        GeometryReader{proxy in
            ScrollView{
                VStack(alignment: .center, spacing: 10){
                    ForEach(list_view_viewmodel.diarys, id: \.self){diary in
                        
                        List_View_cell(diary : diary)
                            .onTapGesture {
                                
//                                detailview_viewmodel.addDiary(diary)
                                detailview_viewmodel.title_temp(diary.Title)
                                print(detailview_viewmodel.detail_diary)
                                detailview_viewmodel.detail_temp(diary.Detail)
                                pathmodel.paths.append(.Detail_View)
                                
                                print("click idx \(diary)")

                                
                        }
                    }
                    
                    
                }
                .padding(.vertical, now_drag ? padding_drag.height : 0)
                .offset(y : CGFloat(currentIndex * 330))
                .gesture(
                    DragGesture()
                    
                        .onChanged({Value in
                            withAnimation(.interactiveSpring){
                                now_drag = true
                                padding_drag.height = Value.translation.height
                            }
                            
                        })
                    
                        .onEnded({ Value in
                            now_drag = false
                            print("value \(Value.translation)")
                            withAnimation(.interactiveSpring){
//                               드래그를 아래로 할 시
                                if(Value.translation.height > 0){
                                    
                                    if(currentIndex == 0){
                                        
                                    }
                                    else{
                                        currentIndex += 1
                                    }
                                    
                                }
                                else if(Value.translation.height < 0){
                                    if(abs(currentIndex) == numberOfItems - 1){
                                        withAnimation(.spring){
                                            currentIndex = -1 * (numberOfItems - 1)
                                        }
                                    }
                                    else{
                                        currentIndex -= 1
                                    }
                                }
                            }
                            print("idx \(abs(currentIndex))")
                        })
                )
            }
            .scrollDisabled(true)
            
//        }
//        .padding(.all)
        
        
    }
    
    
}



#Preview {
    List_View()
}
