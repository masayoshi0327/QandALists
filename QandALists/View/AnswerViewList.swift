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
            
            Group{
                Text(title)
                    .fontWeight(.bold)
                
                Text(solution)
            }
            .foregroundColor(.black)
            
            if url.isEmpty == false{
                HStack{
                    
                    Image(systemName: "link")
                        .font(.caption)
                        .foregroundColor(.black)
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
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 2, x: 1, y: 1)
    }
}
