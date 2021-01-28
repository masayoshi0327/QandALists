//
//  AnswerView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

struct AnswerView: View {
    
    @StateObject var answerData = QuestionController()
    @FetchRequest(entity: Answer.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)],animation: .spring()) var results : FetchedResults<Answer>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ScrollView{
            
            LazyVStack(spacing:10){
                
                Divider()
            
                ForEach(results){a in
                    AnswerViewList(title: a.title ?? "", solution: a.solution ?? "", url: a.url ?? "", date: a.date ?? Date())
                        .contextMenu(ContextMenu(menuItems: {
                            Button(action: {
                                answerData.moveAnswerEditor(item: a)
                            }, label: {
                                Text("編集")
                            })
                            Button(action: {
                                context.delete(a)
                                try! context.save()
                            }, label: {
                                Text("削除")
                            })
                        }))
                        .sheet(isPresented: $answerData.isMoveEdit, content: {
                            AnswerViewEdit(answerData: answerData)
                        })
                }
            }
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
