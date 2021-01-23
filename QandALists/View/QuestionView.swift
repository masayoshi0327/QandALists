//
//  QuestionView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

struct QuestionView: View {
    
    @StateObject var questionData = QuestionController()
    
    var body: some View {
        VStack{

            Text("This is question")
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                Button(action: {questionData.isNewData.toggle()}, label: {
                    Text("Button")
                })
                .sheet(isPresented: $questionData.isNewData, content: {
                    QuestionViewNew(questionData: QuestionController())
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
