//
//  DeleteAlert.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/05.
//

import SwiftUI

struct DeleteAlert: View {
    
    @State var deleteAlert = false
    
    var body: some View {
        Alert(title: Text("削除しますか？"), primaryButton: .default(Text("くろ"), action: {
            deleteAlert = true
        }), secondaryButton: .default(Text("しろ"), action: {
            deleteAlert = false
        }))
    }
}

struct DeleteAlert_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAlert()
    }
}
