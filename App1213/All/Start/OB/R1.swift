//
//  R1.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Bright anWelcome to The Ultimate Dessert Guide!")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 9)
                    
                    Text("Discover, rate, and enjoy the best desserts around.")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 13).fill(Color("prim")))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 270)
            }
        }
    }
}

#Preview {
    R1()
}
