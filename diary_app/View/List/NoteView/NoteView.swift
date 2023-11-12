//
//  NoteVIew.swift
//  diary_app
//
//  Created by 최영호 on 11/3/23.
//

import SwiftUI

struct NoteView: View {
//    @EnvironmentObject private var pathmodel : PathModel
    var body: some View {
        
            ZStack{
//                let _ = print("\(pathmodel)")
                List_View()
                
                Plus_btn_view()
                    .offset(x : calculator_ratio_x(x: CGFloat(CGFloat(UIScreen.main.bounds.midX))), y : calculator_ratio_y(y: CGFloat(CFloat(UIScreen.main.bounds.midY))))
                
//                let _ = print("Plus_btn_view \(UIScreen.main.bounds.midX) \(UIScreen.main.bounds.midY)")
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
