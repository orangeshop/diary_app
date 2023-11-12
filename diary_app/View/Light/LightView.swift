//
//  LightView.swift
//  diary_app
//
//  Created by 최영호 on 11/1/23.
//

import SwiftUI

struct LightView: View {
    @State var toggle_light_click : Bool = false
    var body: some View {
        VStack{
            
            Rectangle()
                .frame(width: 10, height: 50)
                .overlay {
                    
                    ZStack{
                        
                        Circle()
                            .foregroundStyle(.yellow)
                            .frame(width: 50, height: 50)
                            .padding(.top, 50)
                        
                        Button(action: {
                            let _ = print("Light click")
                            toggle_light_click.toggle()
                            
                        }, label: {
                            Circle()
                                .foregroundStyle(.yellow)
                                .frame(width: 50, height: 50)
                                .padding(.top, 50)
                                .shadow(color: toggle_light_click ? .yellow : .clear, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        })
                    }
                }
                .padding(.top, 65)
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 40)
    }
}

#Preview {
    LightView()
}
