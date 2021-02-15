//
//  FourthPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/12.
//

import SwiftUI

struct FourthPage: View {
    var body: some View {
        VStack{
            
            Text("わかったことを読み返そう")
                .font(.title2)
                .fontWeight(.bold)
            
            Description(imageNum: "4-1", description: "画面下のタブを切り替えるとわかったことリストに移動します。わかったことはすべてここに保存されています。")
            
            Description(imageNum: "4-2", description: "検索機能で特定のタイトルを探せます。また、画面右上にはリストの数が表示されています。どんどん数を増やしましょう。")
            
        }
    }
}

struct FourthPage_Previews: PreviewProvider {
    static var previews: some View {
        FourthPage()
    }
}
