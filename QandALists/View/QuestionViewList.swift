//
//  QuestionViewList.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/24.
//

import SwiftUI

struct QuestionViewList: View {
    var body: some View {
        
        Button(action: {}, label: {
            VStack{
                HStack{
                    Text("Task")
                        .font(.title2)
                        .foregroundColor(.black)
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Text("date")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(#colorLiteral(red: 1, green: 0.97928039, blue: 0.8576300865, alpha: 1)))
            .cornerRadius(20)
            .shadow(radius: 1, x: 3, y: 3)
        })
    }
}

struct QuestionViewList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewList()
    }
}
