//
//  R2.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Fun visualization")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 9)
                    
                    Text("Your personal dessert diary—track your sweet experiences today!")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    R2()
}
