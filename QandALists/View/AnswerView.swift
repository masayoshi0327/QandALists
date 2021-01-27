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
            
            LazyVStack(spacing:0){
                
                Divider()
            
                ForEach(results){a in
                    AnswerViewList(title: a.title!, solution: a.solution!, date: a.date!)
                        .contextMenu(ContextMenu(menuItems: {
                            Button(action: {
                                //answerData.EditItem(item: a)
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
