//
//  AnswerViewList.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/27.
//

import SwiftUI

struct AnswerViewList: View {
    
    //var item : Answer
    
    var title : String
    var solution : String
    var url : String
    var date : Date
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
        
            Text(title)
                .fontWeight(.bold)
            
            Text(solution)
            
            if url.isEmpty == false{
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(#colorLiteral(red: 0.9177905035, green: 1, blue: 0.9291417856, alpha: 1)))
        .cornerRadius(20)
        .shadow(radius: 1, x: 1, y: 1)
    }
}
