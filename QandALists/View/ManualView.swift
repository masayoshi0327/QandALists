//
//  ManualView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/12.
//

import SwiftUI

struct ManualView: View {
    
    @State var selected:Int = 1
    @Binding var closeManuals: Bool
    
    var body: some View {
        
        ZStack{
            
            TabView(selection: $selected) {
                FirstPage().tag(1)
                SecondPage().tag(2)
                ThirdPage().tag(3)
                FourthPage().tag(4)
                FifthPage().tag(5)
                SixthPage(closeManuals: $closeManuals).tag(6)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack{
                
//                Spacer()
//
//
//                HStack{
//                    //Back
//                    VStack{
//                        Image(systemName: "chevron.compact.left")
//                            .font(.title)
//                        Text("Back")
//                            .font(.caption)
//                    }
//                    .padding()
//                    .foregroundColor(selected == 1 ? .clear:.gray)
//
//                    Spacer()
//
//                    //Next
//                    VStack{
//
//                        Image(systemName: "chevron.compact.right")
//                            .font(.title)
//                        Text("Next")
//                            .font(.caption)
//                    }
//                    .padding()
//                    .foregroundColor(selected == 5 ? .clear:.gray)
//                }
                
                Spacer()
                
                HStack{
                    
                    ForEach(1..<7) { n in
                        Text("\(n)")
                            .padding()
                            .font(n == selected ? .title2:.headline)
                            .foregroundColor(n == selected ? .yellow:.gray)
                    }
                }
            }
        }
    }
}
