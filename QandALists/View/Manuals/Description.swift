//
//  Description.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/15.
//

import SwiftUI

struct Description: View {
    
    let imageNum: String
    let description: String
    
    var body: some View {
        HStack{
            
            Image("HowToUse\(imageNum)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            
            Spacer()
            
            Text(description)
        }
        .frame(width: 280)
    }
}

struct Description_Previews: PreviewProvider {
    static var previews: some View {
        Description(imageNum: "2-1", description: "右下のボタンから新規作成画面に移動できます。")
    }
}
