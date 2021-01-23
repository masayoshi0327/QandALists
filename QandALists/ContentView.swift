//
//  ContentView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {

        TabView() {
            
            QuestionView()
                .tabItem {Image(systemName: "questionmark")}.tag(1)
            AnswerView()
                .tabItem {Image(systemName: "lightbulb")}.tag(2)
        }
    }
}
