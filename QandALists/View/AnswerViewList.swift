//
//  AnswerViewList.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/27.
//

import SwiftUI

struct AnswerViewList: View {
    
    var title : String
    var solution : String
    var date : Date
    
    var body: some View {
        
        VStack(alignment: .leading){
        
            VStack(alignment: .leading, spacing: 10, content: {
            
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(solution)
                
                
                Text(date, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
            })
            .padding()
            
            Divider()
        }
        .contentShape(Rectangle())
    }
}

struct AnswerViewList_Previews: PreviewProvider {
    static var previews: some View {
        AnswerViewList(
            title: "JavaScript if文 使い方",
            solution: "条件分岐に使う",
            date: Date()
        )
    }
}
