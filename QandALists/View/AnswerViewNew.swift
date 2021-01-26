//
//  AnswerViewNew.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/25.
//

import SwiftUI

struct AnswerViewNew: View {
    
    var title :String
    
    var body: some View {
        VStack{
            
            HStack{
                
                Text(title)
                    .font(.title)
                Spacer()
            } // タイトル
            .padding()
            
            Divider()
                .padding(.horizontal)
            
          
        }
    }
}

struct AnswerViewNew_Previews: PreviewProvider {
    static var previews: some View {
        AnswerViewNew(title: "if文使い方")
    }
}
