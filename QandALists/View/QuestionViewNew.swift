//
//  QuestionViewNew.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

struct QuestionViewNew: View {
    @ObservedObject var questionData : QuestionController
    @Environment(\.managedObjectContext) var context
    var body: some View {
        
        VStack{
            
            HStack{
                
                Text("課題")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {questionData.saveQuestion(context: context)}, label: {
                    Text("Add")
                })
            }
            .padding(.horizontal)
            
            TextField("ここに入力" ,text: $questionData.content)
            
            Divider()
        }
        .padding()
    }
}

struct QuestionViewNew_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewNew(
            questionData: QuestionController()
        )
    }
}
