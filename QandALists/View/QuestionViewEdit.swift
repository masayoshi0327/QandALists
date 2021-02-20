//
//  QuestionViewEdit.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/08.
//

import SwiftUI

struct QuestionViewEdit: View {
    
    @ObservedObject var questionData : QuestionController
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
                Button(action: {questionData.updateQuestion(context: context)}, label: {
                    HStack{
                        Spacer()
                        Text("更新")
                            .foregroundColor(questionData.content.isEmpty ? .gray : .yellow)
                        Spacer()
                    }
                })
                .disabled(questionData.content.isEmpty)
            }
        }
    }
}

struct QuestionViewEdit_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewEdit(questionData: QuestionController())
    }
}
