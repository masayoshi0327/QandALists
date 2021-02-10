//
//  QuestionView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI
import CoreData

struct QuestionView: View {
    
    @State var deleteAlert = false
    @State var deleteItem : Question? = nil
    @StateObject var questionData = QuestionController()
    @FetchRequest(entity: Question.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Question>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
            
        NavigationView{
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                
                if results.isEmpty{
                    VStack{
                        Spacer()
                        Text("わからないことを整理しましょう")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                else{
                    ScrollView(showsIndicators: false){
                        
                        LazyVStack(spacing: 20){
                        
                            ForEach(results){q in
                                
                                QuestionViewList(item: q)
                                    .contextMenu(ContextMenu(menuItems: {
                                        Button(action: {
                                            questionData.moveQuestionEditor(item: q)
                                        }, label: {
                                            Text("編集")
                                        })
                                        Button(action: {
                                            deleteItem = q
                                            deleteAlert = true
                                        }, label: {
                                            Text("削除")
                                        })
                                    }))
                                    .sheet(isPresented: $questionData.isUpdateData, content: {
                                        QuestionViewEdit(questionData: questionData)
                                    })
                                    
                                    .alert(isPresented: $deleteAlert, content: {
                                        Alert(title: Text("削除しますか？"), primaryButton: .destructive(Text("はい"), action: {
                                            context.delete(deleteItem!)
                                            try! context.save()
                                            deleteItem = nil
                                        }), secondaryButton: .cancel(Text("キャンセル"), action: {
                                            deleteAlert = false
                                        }))
                                    })
                            }
                        }
                    }
                }
            
                Button(action: {
                    questionData.content = ""
                    questionData.isNewData.toggle()
                }, label: {
                    QuestionViewButton()
                })
                .sheet(isPresented: $questionData.isNewData, content: {
                    QuestionViewNew(questionData: questionData)
                })
                .padding()
            })
            .navigationTitle("わからないことリスト")
        }
    }
}
