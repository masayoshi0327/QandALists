//
//  AnswerViewCount.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/04.
//

import SwiftUI

struct AnswerViewCount: View {
    
    var count: Int
    
    var body: some View {
        VStack{
            Image(systemName: "sparkles")
                .resizable()
                .frame(width: 25, height: 25)
            Text("\(count)")
        }
        .foregroundColor(.yellow)
    }
}

struct AnswerViewCount_Previews: PreviewProvider {
    static var previews: some View {
        AnswerViewCount(count: 200)
    }
}
