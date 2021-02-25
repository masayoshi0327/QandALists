//
//  FirstPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/12.
//

import SwiftUI

struct FirstPage: View {
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("ようこそ。")
                .font(.title)
                .padding()
            
            DescriptionText(addText: "はあなただけの勉強サポートツールです。")
                        
            DescriptionText(addText: "の効果的な使い方について説明します。")
        }
        .frame(width: 300, height: 300)
        .lineSpacing(5)
    }
}

struct DescriptionText: View {
    
    let addText: String
    
    var body: some View {
        (Text("わかりすと")
            .fontWeight(.bold)
            .foregroundColor(.yellow)
            + Text(addText))
            .padding()
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
