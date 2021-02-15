//
//  SecondPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/14.
//

import SwiftUI

struct SecondPage: View {
    var body: some View {
        VStack{
            Text("わからないことを整理しよう")
                .font(.title2)
                .fontWeight(.bold)
            
            Description(imageNum: "2-1", description: "右下のボタンから新規作成画面に移動できます。")
            
            Description(imageNum: "2-2", description: "自分が今調べたいと思っていること、疑問に思っていることを書き出しましょう。")
        }
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
