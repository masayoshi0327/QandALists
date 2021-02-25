//
//  SixthPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/25.
//

import SwiftUI

struct SixthPage: View {
    
    @Binding var closeManuals: Bool
    
    var body: some View {
        
        VStack{
            Text("さあ、勉強を始めましょう！")
                .font(.title2)
            
            
            Spacer()
            
            Button(action: {closeManuals.toggle()}, label: {
                Text("スタート")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
            })
        }
        .frame(height: 100)
    }
}

//struct SixthPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SixthPage()
//    }
//}
