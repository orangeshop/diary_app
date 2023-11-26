//
//  NoteVIew.swift
//  diary_app
//
//  Created by 최영호 on 11/3/23.
//

import SwiftUI
import CoreData
struct NoteView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var diary_core : FetchedResults<Diray_coremodel>
    
    @EnvironmentObject private var list_viewmodel : List_View_ViewModel
    
    var body: some View {
        
            ZStack{

                List_View()
                    
                
                Plus_btn_view()
                    .offset(x : calculator_ratio_x(x: CGFloat(CGFloat(UIScreen.main.bounds.midX))), y : calculator_ratio_y(y: CGFloat(CFloat(UIScreen.main.bounds.midY))))
            }
            
    }
    
    func calculator_ratio_x(x : CGFloat)-> CGFloat{
        var offset : CGFloat = CGFloat(x)
        
        offset = CGFloat(x) - CGFloat((x/20) * 4)
        
        return offset
    }
    
    func calculator_ratio_y(y : CGFloat) -> CGFloat{
        var offset : CGFloat = CGFloat(y)
        
        offset = CGFloat(y) - CGFloat((y/20) * 8)
        
        return offset
    }
    
    
}

#Preview {
    NoteView()
}
