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
        VStack{
            
            HStack{
                
                Text("This is question")
                
                Spacer()
                
            }
            .padding()
            ScrollView(showsIndicators: false){
                
                LazyVStack(spacing: 20){
                    
                    ForEach(results){q in
                        
                        QuestionViewList()
                    }
                }
            }
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                Button(action: {questionData.isNewData.toggle()}, label: {
                    Text("Button")
                })
                .sheet(isPresented: $questionData.isNewData, content: {
                    QuestionViewNew(questionData: questionData)
                })
            }
            .padding()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
