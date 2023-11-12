//
//  Plus_btn_view.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

struct Plus_btn_view: View {
    @EnvironmentObject var pathmodel : PathModel
    var body: some View {
        
        Button(action: {
            print("plus btn click")
            print("\(pathmodel.paths)")
            pathmodel.paths.append(.Write_View)
        }, label: {
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 65, height: 65)
                .overlay {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                }
        })
        
    }
}

#Preview {
    Plus_btn_view()
}
