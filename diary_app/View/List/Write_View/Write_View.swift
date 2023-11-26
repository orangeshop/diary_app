//
//  Write_View.swift
//  diary_app
//
//  Created by 최영호 on 11/2/23.
//

import SwiftUI
import CoreData
struct Write_View: View {
    
    @EnvironmentObject private var list_view_model : List_View_ViewModel
    
    @EnvironmentObject private var write_view_viewmodel : Write_View_ViewModel
    
    
    var body: some View {
        
        VStack{
            //MARK: 상단 navigatoin
            CustomNavigationView(write_view_viewmodel: write_view_viewmodel)
                
            //MARK: 입력 부분
            Spacer()
            
            let _ = print("\(write_view_viewmodel.mode)")
            
            assemble_Write_View(write_view_viewmodel: write_view_viewmodel)
            
            Spacer()
            
        }
        .padding(.top, 20)
    }
}

struct assemble_Write_View : View {
    
    @ObservedObject private var write_view_viewmodel : Write_View_ViewModel
    
    init(write_view_viewmodel: Write_View_ViewModel) {
        self.write_view_viewmodel = write_view_viewmodel
    }
    
//    @FocusState private var isFocuse : Bool
    @State var focuse : Bool = false
    var body: some View {
        VStack(alignment: .leading){
            
            Write_Title_Text_Field_View(write_viewmodel: write_view_viewmodel, inner_isfocuse: $focuse, list_view_model: List_View_ViewModel())
//                .focused($isFocuse)
//                .onTapGesture {
//                    isFocuse.toggle()
//                    focuse.toggle()
//                }
            
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 2)
            
            Spacer()
            Write_Detail_Text_Field_View(write_viewmodel: write_view_viewmodel)
//                .onTapGesture {
//                    print("\(isFocuse)")
//                    isFocuse.toggle()
//                }
            Spacer()
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 2)
        }
        .padding()
        
    }
}

struct Write_Detail_Text_Field_View : View {
    
    @ObservedObject private var write_viewmodel : Write_View_ViewModel
//    @FocusState private var isFocused: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    fileprivate init(write_viewmodel: Write_View_ViewModel) {
        self.write_viewmodel = write_viewmodel
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Detail")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(colorScheme == .dark ? Color.white : .black)
            HStack{
                Spacer()
                TextEditor(text: write_viewmodel.mode == true ? $write_viewmodel.temp_detail: $write_viewmodel.detail)
                    .foregroundStyle(colorScheme == .dark ? Color.white : .black)
//                    .focused($isFocused)
                    .clipShape(.rect(cornerRadius: 20))
                    .font(.system(size: 20, weight: .ultraLight))
                    
            }
            
        }
//        .onTapGesture {
//            isFocused.toggle()
//            print("\(isFocused)")
//        }
        .padding()
    }
}

struct Write_Title_Text_Field_View : View {
    
    @ObservedObject var write_viewmodel : Write_View_ViewModel
    @Binding var inner_isfocuse : Bool
    @ObservedObject var list_view_model : List_View_ViewModel

    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
//    private var diarys : Diary
    
    
//    @State var test : String = "\(list_view_model.diarys[write_viewmodel.idx].Title )"
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Title")
                .font(.system(size: 30, weight: .bold))
            //            let _ = print("in text mode \(write_viewmodel.mode)")
            
            
            
            TextField("제목을 적어주세요!",text: write_viewmodel.mode == true ? $write_viewmodel.temp_title: $write_viewmodel.title)
                .font(.system(size: 30))
                .foregroundStyle(colorScheme == .dark ? Color.white : .black)
            //                .foregroundStyle(inner_isfocuse ? .black : .gray)
            
            
            //            let _ = print("text feild \($write_viewmodel.title)")
        }
        //        .onTapGesture {
        //            isFocuse.toggle()
        //        }
    }
}

struct CustomNavigationView : View {
    @EnvironmentObject private var pathmodel : PathModel
    @EnvironmentObject private var list_view_viewmodel : List_View_ViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject private var write_view_viewmodel : Write_View_ViewModel
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var diary_core : FetchedResults<Diray_coremodel>
    
    init(write_view_viewmodel: Write_View_ViewModel
    ) {
        self.write_view_viewmodel = write_view_viewmodel
    }
    
    @State private var alert_check : Bool = false
    
    var body: some View {
        HStack{
            Button(action: {
                
//                let _ = print("aaaa \(write_view_viewmodel.title)")
                if(write_view_viewmodel.mode == true){
                    write_view_viewmodel.mode = false
                }
                
                
                
                write_view_viewmodel.change_mode(num: -1, diary: list_view_viewmodel.diarys)
                pathmodel.paths.removeLast()
            }, label: {
                Text("뒤로")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(colorScheme == .dark ? Color.white : .black)
                
                
            })
            
            Spacer()
            
            Button(action: {
                
                
                if(write_view_viewmodel.title == "" && write_view_viewmodel.mode == false){
                    print("비어있음")
//                    write_view_viewmodel.title = write_view_viewmodel.title
                    alert_check.toggle()
                    print(alert_check)
                }
                else if
                    (write_view_viewmodel.temp_title == "" && write_view_viewmodel.mode == true){
                    print("비어있음")
//                    write_view_viewmodel.title = write_view_viewmodel.temp_title
                    alert_check.toggle()
                    print(alert_check)
                }
//                else if(write_view_viewmodel.detail == "" || write_view_viewmodel.temp_detail == ""){
//                    alert_check.toggle()
//                }
                else{
                    if(write_view_viewmodel.mode == true){
                        
//                        print("hi \(write_view_viewmodel.idx)")
                        
                        list_view_viewmodel.correctionDiary(.init(Title: write_view_viewmodel.temp_title, Date: write_view_viewmodel.day, Detail: write_view_viewmodel.temp_detail), num: write_view_viewmodel.idx)
                        
                        CoreDataController().add_diary(date: write_view_viewmodel.day, title: write_view_viewmodel.temp_title, detail: write_view_viewmodel.temp_detail, context: managedObjectContext)
                        
                        if(write_view_viewmodel.mode == true){
//                            write_view_viewmodel.mode = false
                            write_view_viewmodel.change_mode(num:-1, diary : list_view_viewmodel.diarys)
                        }
                    }
                    else{
                        
                        list_view_viewmodel.addDiary(.init(Title: write_view_viewmodel.title, Date: write_view_viewmodel.day, Detail: write_view_viewmodel.detail))
                        
                        CoreDataController().add_diary(date: write_view_viewmodel.day, title: write_view_viewmodel.title, detail: write_view_viewmodel.detail, context: managedObjectContext)
                        
                        
                        write_view_viewmodel.change_mode(num:-1, diary : list_view_viewmodel.diarys)
                    }
                    
                    
                    
                    pathmodel.paths.removeLast()
                    print(list_view_viewmodel.diarys)
                    
                }
                print(write_view_viewmodel.title)
                
//
                
                
            }, label: {
                Text("저장")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(colorScheme == .dark ? Color.white : .black)
            })
            .alert("제목을 입력해주세요.", isPresented: $alert_check, actions: {
                Text("닫기")
            })
        }
        .foregroundStyle(.black)
        .padding(.all, 20)
    }
}

#Preview {
    Write_View()
}
