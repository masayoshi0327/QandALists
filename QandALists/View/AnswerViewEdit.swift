//
//  AnswerViewEdit.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/28.
//

import SwiftUI

struct AnswerViewEdit: View {
    
    @ObservedObject var answerData : QuestionController
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        Form{
            Section(header:
                        HStack{
                            Image(systemName: "questionmark.circle")
                            Text("タイトル")
                        }){
                TextField("タイトル", text: $answerData.title)
            }
            
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
            Button(action: {answerData.updateAnswer(context: context)}, label: {
                HStack{
                    Spacer()
                    Text("更新")
                        .foregroundColor(answerData.solution.isEmpty || (!answerData.isURL(answerData.url) && !answerData.url.isEmpty) ? .gray:.green)
                    Spacer()
                }
            })
            .disabled(answerData.solution.isEmpty || (!answerData.isURL(answerData.url) && !answerData.url.isEmpty))
        }
    }
}
