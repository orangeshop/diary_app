//
//  diary_appApp.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

@main
struct diary_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(List_View_ViewModel())
                .environmentObject(detailView_ViewModel())
                .environmentObject(Write_View_ViewModel())
        }
    }
}
