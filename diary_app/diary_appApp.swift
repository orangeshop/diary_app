//
//  diary_appApp.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

@main
struct diary_appApp: App {
    @StateObject private var dataController = CoreDataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.contrainer.viewContext)
                .environmentObject(List_View_ViewModel())
                .environmentObject(detailView_ViewModel())
                .environmentObject(Write_View_ViewModel())
        }
    }
}
