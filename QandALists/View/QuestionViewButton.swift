//
//  QuestionViewButton.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/04.
//

import SwiftUI

struct QuestionViewButton: View {
    var body: some View {
        
        ZStack{
            
            VStack{
            
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Add")
            }
            .padding()
            .frame(width: 75, height: 75, alignment: .center)
            .foregroundColor(.white)
            .background(Color.yellow)
            .clipShape(Circle())
        }
    }
}

struct QuestionViewButton_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewButton()
    }
}
