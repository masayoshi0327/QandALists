//
//  QuestionViewList.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/24.
//

import SwiftUI

struct QuestionViewList: View {
    
    var content : String
    var date : Date
    
    var body: some View {
        
        NavigationLink(destination: AnswerViewNew()){
            
            VStack{
                HStack{
                    Text(content)
                        .font(.title2)
                        .foregroundColor(.black)
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Text(date, style: .date)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(#colorLiteral(red: 1, green: 0.97928039, blue: 0.8576300865, alpha: 1)))
            .cornerRadius(20)
            .shadow(radius: 1, x: 3, y: 3)
        }
    }
}

struct QuestionViewList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewList(content: "if文の使いかた", date: Date())
    }
}
