//
//  Write_View.swift
//  diary_app
//
//  Created by 최영호 on 11/2/23.
//

import SwiftUI

struct Write_View: View {
    
    @EnvironmentObject private var list_view_model : List_View_ViewModel
    
    @StateObject private var write_view_viewmodel = Write_View_ViewModel()
    
    var body: some View {
        VStack{
            //MARK: 상단 navigatoin
            CustomNavigationView(write_view_viewmodel: write_view_viewmodel)
                
            //MARK: 입력 부분
            Spacer()
            
//            Write_Text_Field_View(write_viewmodel: write_view_viewmodel)
            
            assemble_Write_View(write_view_viewmodel: write_view_viewmodel)
            
            Spacer()
            
        }
        
    }
}

struct assemble_Write_View : View {
    
    @ObservedObject private var write_view_viewmodel : Write_View_ViewModel
    
    init(write_view_viewmodel: Write_View_ViewModel) {
        self.write_view_viewmodel = write_view_viewmodel
    }
    
    var body: some View {
        VStack{
            ZStack{
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 150)
                    .clipShape(.rect(cornerRadius: 35))
                
                Write_Title_Text_Field_View(write_viewmodel: write_view_viewmodel)
                    .foregroundStyle(.white)
                    .padding()
            }
            
            ZStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 500)
                    .clipShape(.rect(cornerRadius: 35))
                
                Write_Detail_Text_Field_View(write_viewmodel: write_view_viewmodel)
                    
                    .padding()
            }
        }
    }
}

struct Write_Detail_Text_Field_View : View {
    
    @ObservedObject private var write_viewmodel : Write_View_ViewModel
    @FocusState private var isFocused: Bool
    
    fileprivate init(write_viewmodel: Write_View_ViewModel) {
        self.write_viewmodel = write_viewmodel
    }
    
    var body: some View {
        VStack{
            Text("Detail :")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.white)
            HStack{
                Spacer()
                TextEditor(text: $write_viewmodel.detail)
                    .focused($isFocused)
                    .clipShape(.rect(cornerRadius: 20))
                    .font(.system(size: 20, weight: .ultraLight))
                    .lineLimit(5)
                    
            }
            
        }
        .onTapGesture {
            isFocused.toggle()
        }
        .padding()
    }
}

struct Write_Title_Text_Field_View : View {
    
    @ObservedObject private var write_viewmodel : Write_View_ViewModel
    
    fileprivate init(write_viewmodel: Write_View_ViewModel) {
        self.write_viewmodel = write_viewmodel
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Title :")
                    .font(.system(size: 30, weight: .bold))
                
                Spacer()
                TextEditor(text: $write_viewmodel.title)
                    .font(.system(size: 30))
                
                let _ = print("text feild \($write_viewmodel.title)")
                    
            }
            
        }
        .padding()
    }
}

struct CustomNavigationView : View {
    @EnvironmentObject private var pathmodel : PathModel
    @EnvironmentObject private var list_view_viewmodel : List_View_ViewModel
    
    @ObservedObject private var write_view_viewmodel : Write_View_ViewModel
    
    init(write_view_viewmodel: Write_View_ViewModel
    ) {
        self.write_view_viewmodel = write_view_viewmodel
    }

    
    var body: some View {
        HStack{
            Button(action: {
                pathmodel.paths.removeLast()
                
            }, label: {
                Text("뒤로")
                    .font(.system(size: 20, weight: .bold))
            })
            Spacer()
            Button(action: {
                
                print(write_view_viewmodel.title)
                
                list_view_viewmodel.addDiary(.init(Title: write_view_viewmodel.title, Date: write_view_viewmodel.day, Detail: write_view_viewmodel.detail))
                pathmodel.paths.removeLast()
                print(list_view_viewmodel.diarys)
                
            }, label: {
                Text("저장")
                    .font(.system(size: 20, weight: .bold))
            })
        }
        .foregroundStyle(.black)
        .padding(.all, 20)
    }
}

#Preview {
    Write_View()
}
