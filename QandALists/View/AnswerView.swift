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
    @StateObject var answerData = QuestionController()
    @FetchRequest(entity: Answer.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)],animation: .spring()) var results : FetchedResults<Answer>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
            
        VStack{

            HStack{
                
                
                TextField("タイトルを検索", text: $searchWord)
                    .padding()
                
                if isKeyboardOpened{
                
                    Button(action: {UIApplication.shared.closeKeyboard()}, label: {
                        Text("完了")
                    })
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                isKeyboardOpened = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                isKeyboardOpened = false
            }
            
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
