//
//  AnswerViewNew.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/25.
//

import SwiftUI

struct AnswerViewNew: View {
    
    var question : Question
    @StateObject var answerData = QuestionController()
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            
            HStack{
                
                Text(question.content!)
                    .font(.title)
                Spacer()
            } // タイトル
            .padding()
            
            Divider()
                .padding(.horizontal)
            
            TextEditor(text: $answerData.solution)
            
            Button(action: {answerData.saveAnswer(q: question, context: context)}, label: {
                Text("Button")
            })
            
            
            
          
        }
    }
}

struct AnswerViewNew_Previews: PreviewProvider {
    static var previews: some View {
        AnswerViewNew(question: Question())
    }
}
