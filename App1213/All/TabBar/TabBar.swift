//
//  TabBar.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim2") : .white)
                            .frame(width: 15, height: 15)
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 7).fill(Color.white).opacity(selectedTab == index ? 1 : 0))

//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("prim2") : Color.gray.opacity(0.4))
//                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 24)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim2")))
        .padding(.horizontal, 60)
    }
}

enum Tab: String, CaseIterable {
    
    case Restaurants = "Restaurants"
    
    case Selected = "Selected"
    
    case Settings = "Settings"

}
