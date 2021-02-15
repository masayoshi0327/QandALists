//
//  FifthPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/15.
//

import SwiftUI

struct FifthPage: View {
    
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

//struct FifthPage_Previews: PreviewProvider {
//    static var previews: some View {
//        FifthPage(closeManuals: Binding<true>)
//    }
//}
