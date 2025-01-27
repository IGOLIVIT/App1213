//
//  ContentView.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Restaurants

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        RestaurantsView()
                            .tag(Tab.Restaurants)
                        
                        SelectedView()
                            .tag(Tab.Selected)

                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
                VStack {
                    
                    Spacer()
                    
                    TabBar(selectedTab: $current_tab)

                }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
