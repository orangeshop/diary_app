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
    
    @EnvironmentObject private var write_view_viewmodel : Write_View_ViewModel
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    private var diary : Diary
    
    init(diary: Diary
    ) {
        self.diary = diary
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 1)
            HStack{
                Text("\(diary.Title)")
                    .lineLimit(2)
                    .font(.system(size: 30, weight: .bold))
                
                Spacer()
                HStack{
                    Text("\(diary.converedDate(date: diary.Date))")
                    Menu("\(Image(systemName: "ellipsis"))"){
                        Button(action: {
                            
//                            let _ = print("\(write_view_viewmodel.mode)")
                            write_view_viewmodel.mode = true
                            write_view_viewmodel.idx = list_view_viewmodel.idxDiary(diary)
                            
                            let _ = print("\(list_view_viewmodel.idxDiary(diary))")
                            
                            write_view_viewmodel.change_mode(num : list_view_viewmodel.idxDiary(diary), diary: list_view_viewmodel.diarys)
                            
//                            let _ = print(write_view_viewmodel.mode)
                                
                            pathmodel.paths.append(.Write_View)
                            
                           
                            
                        }, label: {
                            Text("수정")
                        })
                        
                        Button(action: {
//                            print("a")
                            
//                            print(list_view_viewmodel.idxDiary(diary))
                            
                            list_view_viewmodel.deleteDiary(list_view_viewmodel.idxDiary(diary))
                            
                        }, label: {
                            Text("Delete")
                            
                                
                        })
                    }
                    
                    .foregroundStyle(colorScheme == .dark ? Color.white : .black)
                    
                }
                .padding(.trailing, 10)
            }
            
            HStack(alignment: .top){
                Rectangle()
                    .frame(width: 1,height: CGFloat(40 * diary.line_size_check(str: diary.Detail)))
                    .foregroundStyle(.gray)
                
                Text("\(diary.Detail)")
//                    .lineLimit(2)
                    .font(.system(size: 30, weight: .light))
                
//                let _ = print(diary.line_size_check(str: diary.Detail))
                    
            }
        }
        .padding()
        
//        ZStack{
////            Color.yellow
//            Color.black
//            Color.white
//                .frame(width: UIScreen.main.bounds.width - 45, height: 315)
//                .clipShape(.rect(cornerRadius: 12))
//            
//            
//            VStack{
//                HStack{
//                    Text("\(diary.Title)")
//                        .lineLimit(2)
//                        .font(.system(size: 30, weight: .bold))
//                    Spacer()
//                    
//                    Text("\(diary.converedDate(date: diary.Date))")
//                        .font(.system(size: 30, weight: .medium))
//                }
//                .frame(height: 75)
//                .padding()
//                
//                
//                Rectangle()
//                    .frame(width: UIScreen.main.bounds.width - 70, height: 3)
//                
//                
//                HStack{
//                    
//                    
//                    
//                    Rectangle()
////                        .frame(width: 100, height : 75)
//                    
//                    
//                    Text(diary.Detail)
//                        .font(.system(size: 16, weight: .medium))
//                }
//                .padding()
//            }
//        }
//        .shadow(radius: 15)
//        .frame(width: UIScreen.main.bounds.width - 40, height: 320)
//        .clipShape(.rect(cornerRadius: 12))
//        
        
        
    }
    
}

#Preview {
    List_View_cell(diary: .init(Title: "", Date: Date(), Detail: ""))
}
