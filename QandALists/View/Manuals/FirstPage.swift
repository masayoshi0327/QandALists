//
//  FirstPage.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/12.
//

import SwiftUI

struct FirstPage: View {
    
    let app = "わかりすと"
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("ようこそ。")
                .font(.title)
                .padding()
            
            (Text(app)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            + Text("はあなただけの勉強サポートツールです。"))
                .padding()
                
            
            (Text(app)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            + Text("の効果的な使い方について説明します。"))
                .padding()
        }
        .frame(width: 300, height: 300)
        .lineSpacing(5)
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
