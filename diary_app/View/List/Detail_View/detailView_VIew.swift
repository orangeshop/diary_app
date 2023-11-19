//
//  DetailView_VIew.swift
//  diary_app
//
//  Created by 최영호 on 11/12/23.
//

import SwiftUI

struct detailView_View: View {
    @EnvironmentObject private var pathmodel : PathModel
    @EnvironmentObject private var list_view_ViewModel : List_View_ViewModel
    
    var body: some View {
        
        Detail_View_Navigaion_View()
        
        detail_view_Preview()
    }
}

struct Detail_View_Navigaion_View : View {
    @EnvironmentObject var pathmodel : PathModel
    
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
//                pathmodel.paths.removeLast()
                
            }, label: {
                Text("수정")
                    .font(.system(size: 20, weight: .bold))
            })
        }
        .foregroundStyle(.black)
        .padding(.all, 20)
    }
}

struct detail_view_Preview : View {
    
    @EnvironmentObject var detail_view_viewmodel : detailView_ViewModel
    
    var body: some View {
        VStack{
            ZStack{
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 150)
                    .clipShape(.rect(cornerRadius: 35))
                
                Text("\(detail_view_viewmodel.title)")
                    .foregroundStyle(.white)
                    .padding()
            }
            
            ZStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 500)
                    .clipShape(.rect(cornerRadius: 35))
                
                Text("\(detail_view_viewmodel.detail)")
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}




struct test_View : View {
    
    @EnvironmentObject var detail_view_viewmodel : detailView_ViewModel
    @State private var af_text : String = ""
    
    var body: some View {
        Text("\(detail_view_viewmodel.title)")
        
        TextField("", text: $detail_view_viewmodel.title)
    }
}

#Preview {
    detailView_View()
        .environmentObject(detailView_ViewModel())
}
