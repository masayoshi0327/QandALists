//
//  AnswerViewNew.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/25.
//

import SwiftUI

struct AnswerViewNew: View {
    
    var question : Question
    @ObservedObject var answerData : QuestionController
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
         
        Form{
            Section(header:
                HStack{
                    Image(systemName: "lightbulb")
                    Text("説明")
                }){
                TextEditor(text: $answerData.solution)
                    .frame(height: 140)
            }
            
            Section(header:
                HStack{
                    Image(systemName: "link")
                    Text("参考記事")
                }){
                TextField("記事のURLを貼り付け", text: $answerData.url)
            }
            Button(action: {answerData.saveAnswer(q: question, context: context)}, label: {
                HStack{
                    Spacer()
                    Text("解決！")
                        .foregroundColor(answerData.solution.isEmpty || (!answerData.isURL(answerData.url) && !answerData.url.isEmpty) ? .gray:.green)
                    Spacer()
                }
            })
            .disabled(answerData.solution.isEmpty || (!answerData.isURL(answerData.url) && !answerData.url.isEmpty))
        }
        .navigationTitle(question.content ?? "")
    }
}

struct AnswerViewNew_Previews: PreviewProvider {
    static var previews: some View {
        AnswerViewNew(question: Question(), answerData: QuestionController())
    }
}
