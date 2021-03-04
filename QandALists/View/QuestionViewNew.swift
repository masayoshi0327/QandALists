//
//  QuestionViewNew.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

struct QuestionViewNew: View {
    @ObservedObject var questionData: QuestionController
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        NavigationView{
            
            Form{
                
                Section(header:
                            HStack{
                                Image(systemName: "questionmark.circle")
                                Text("課題")
                            }){
                    TextEditor(text: $questionData.content)
                        .frame(height: 140)
                }
                Button(action: {questionData.saveQuestion(context: context)}, label: {
                    HStack{
                        Spacer()
                        Text("追加する")
                            .foregroundColor(questionData.content.isEmpty ? .gray : .yellow)
                        Spacer()
                    }
                })
                .disabled(questionData.content.isEmpty)
            }
        }
    }
}

struct QuestionViewNew_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewNew(
            questionData: QuestionController()
        )
    }
}
