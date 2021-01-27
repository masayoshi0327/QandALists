//
//  AnswerView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

struct AnswerView: View {
    
    @FetchRequest(entity: Answer.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Answer>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ScrollView{
            
            LazyVStack(spacing:20){
            
                ForEach(results){a in
                    VStack{
                     
                        Text(a.title!)
                        Text(a.solution!)
                        Text(a.date!, style: .date)
                    }
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
