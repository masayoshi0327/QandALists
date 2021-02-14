//
//  ManualView.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/02/12.
//

import SwiftUI

struct ManualView: View {
    
    @State var selected:Int = 1
    
    var body: some View {
        
        ZStack{
        
            TabView(selection: $selected) {
                FirstPage().tag(1)
                SecondPage().tag(2)
                ThirdPage().tag(3)
                FourthPage().tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack{
                
                Spacer()
                
                HStack{
                    Image(systemName: "chevron.compact.left")
                        .font(.title)
                        .padding()
                        .foregroundColor(selected == 1 ? .clear:.gray)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.compact.right")
                        .font(.title)
                        .padding()
                        .foregroundColor(selected == 4 ? .clear:.gray)
                }
                
                Spacer()
            
                HStack{
                    
                    ForEach(1..<5) { n in
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

struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        ManualView()
    }
}
