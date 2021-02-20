//
//  AnswerView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

struct AnswerView: View {
    
    @State var searchWord:String = ""
    @State var isKeyboardOpened = false
    @State var deleteAlert = false
    @State var deleteItem : Answer? = nil
    @StateObject var answerData = QuestionController()
    @FetchRequest(entity: Answer.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)],animation: .spring()) var results : FetchedResults<Answer>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                
                Text("わかったことリスト")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                AnswerViewCount(count: results.count)
            }
            .padding(.top)
            .padding(.horizontal)
            
            HStack{
                TextField("タイトルを検索", text: $searchWord)
                
                if isKeyboardOpened{
                    
                    Button(action: {UIApplication.shared.closeKeyboard()}, label: {
                        Text("完了")
                    })
                }
            } //検索バー
            .padding()
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                isKeyboardOpened = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                isKeyboardOpened = false
            }
            
            Divider()
            
            ScrollView{
                
                LazyVStack(spacing:10){
                    
                    ForEach(results){a in
                        
                        if a.title!.contains(searchWord) || searchWord.isEmpty{
                            
                            AnswerViewList(title: a.title ?? "", solution: a.solution ?? "", url: a.url ?? "", date: a.date ?? Date())
                                .contextMenu(ContextMenu(menuItems: {
                                    Button(action: {
                                        answerData.moveAnswerEditor(item: a)
                                    }, label: {
                                        Text("編集")
                                    })
                                    Button(action: {
                                        deleteItem = a
                                        deleteAlert = true
                                    }, label: {
                                        Text("削除")
                                    })
                                }))
                                .sheet(isPresented: $answerData.isMoveEdit, content: {
                                    AnswerViewEdit(answerData: answerData)
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
        }
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
