//
//  FifthPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/15.
//

import SwiftUI

struct FifthPage: View {
    
    var body: some View {
        
        VStack{
            Text("その他の機能")
                .font(.title2)
                .fontWeight(.bold)
            
            Description(imageNum: "5-1", description: "各リストを長押しするとメニューが現れます。メニューから編集、削除ができます。")
        }
    }
}

//struct FifthPage_Previews: PreviewProvider {
//    static var previews: some View {
//        FifthPage(closeManuals: Binding<true>)
//    }
//}
