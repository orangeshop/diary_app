//
//  ContentView.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var pathmodel = PathModel()
    
    
    var body: some View {
        VStack{
            LightView()
                .ignoresSafeArea()
            
            NavigationStack(path: $pathmodel.paths){
                
                NoteView()
                    .navigationDestination(
                        for : PathType.self,
                        destination: {PathType in
                            switch PathType{
                            case .Write_View:
                                let _ = print("in NS")
                                Write_View()
                                    .navigationBarBackButtonHidden()
                                    
                            case .NoteView:
                                Write_View()
                                
                            case .Detail_View:
                                detailView_View()
                                    .navigationBarBackButtonHidden()
                                
                            }
                            
                        }
                    )
//                NoteView()
                
            }
            .environmentObject(pathmodel)
        }
    }
}

#Preview {
    ContentView()
}
