//
//  QuestionView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI
import CoreData

struct QuestionView: View {
    
    @StateObject var questionData = QuestionController()
    
    @FetchRequest(entity: Question.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Question>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
            
        NavigationView{
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
                ScrollView(showsIndicators: false){
                    
                    LazyVStack(spacing: 20){
                    
                        ForEach(results){q in
                            
                            QuestionViewList(item: q)
                                .contextMenu(ContextMenu(menuItems: {
                                    Button(action: {
                                        questionData.EditItem(item: q)
                                    }, label: {
                                        Text("編集")
                                    })
                                    Button(action: {
                                        context.delete(q)
                                        try! context.save()
                                    }, label: {
                                        Text("削除")
                                    })
                                }))
                        }
                        .navigationTitle("Question")
                    }
                }
            
                Button(action: {questionData.isNewData.toggle()}, label: {
                    QuestionViewButton()
                })
                .sheet(isPresented: $questionData.isNewData, content: {
                    QuestionViewNew(questionData: questionData)
                })
                .padding()
            })
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
