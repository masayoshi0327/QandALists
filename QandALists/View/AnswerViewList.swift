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
    var url : String
    var date : Date
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
        
            Text(title)
                .fontWeight(.bold)
            
            Text(solution)
            
            if url != "none"{
                HStack{
                    
                    Image(systemName: "link")
                        .font(.caption)
                    Link(destination: URL(string: url)!, label: {
                        Text(url)
                    })
                }
            }
            
            Text(date, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(#colorLiteral(red: 0.9177905035, green: 1, blue: 0.9291417856, alpha: 1)))
        .cornerRadius(20)
        .shadow(radius: 1, x: 1, y: 1)
    }
}

struct AnswerViewList_Previews: PreviewProvider {
    static var previews: some View {
        AnswerViewList(
            title: "JavaScript if文 使い方",
            solution: "条件分岐に使う",
            url: "https://mobile.twitter.com/masayoshi_tozan",
            date: Date()
        )
    }
}
