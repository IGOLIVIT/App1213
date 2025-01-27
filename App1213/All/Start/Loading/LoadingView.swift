//
//  LoadingView.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                
                Spacer()
                
                ProgressView()
            }
            .padding(.vertical, 200)
        }
    }
}

#Preview {
    LoadingView()
}
