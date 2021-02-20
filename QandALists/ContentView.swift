//
//  ContentView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @AppStorage(wrappedValue: true, "isFirstLaunch") var isFirstLaunch
    
    var body: some View {
        
        TabView() {
            
            QuestionView()
                .tabItem {Image(systemName: "questionmark.circle.fill")}.tag(1)
            AnswerView()
                .tabItem {Image(systemName: "lightbulb.fill")}.tag(2)
        }
        .accentColor(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        .sheet(isPresented: $isFirstLaunch, content: {
            ManualView(closeManuals: $isFirstLaunch)
        })
    }
}
