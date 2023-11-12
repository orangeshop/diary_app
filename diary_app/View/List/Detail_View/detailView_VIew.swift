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
    
//    @StateObject var detail_view_ViewModel = detailView_ViewModel()
    
    
    
    var body: some View {
//        Text("\(detail_view_ViewModel.title)")
        test_View()
    }
}

struct test_View : View {
    
    @EnvironmentObject var detail_view_viewmodel : detailView_ViewModel
    
    var body: some View {
//        let _ = print("ffff\(detail_view_viewmodel.detail_diary.count)")
        Text("\(detail_view_viewmodel.detail_diary[0].Title)")
        Text("\(detail_view_viewmodel.title)")
        
    }
}

#Preview {
    detailView_View()
}
