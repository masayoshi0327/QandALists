//
//  ThirdPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/12.
//

import SwiftUI

struct ThirdPage: View {
    var body: some View {
        
        VStack{
            
            Text("「わからない」を\n「わかった」に変えよう")
                .font(.title2)
                .fontWeight(.bold)
            
            Description(imageNum: "3-1", description: "リストのひとつひとつがボタンになっており、タップするとメモ画面に移動します。")
            
            Description(imageNum: "3-2", description: "「わからなかったこと」が解決したらメモをつけて「解決！」ボタンを押しましょう。わかったことリストに保存されます。")
        }
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}
