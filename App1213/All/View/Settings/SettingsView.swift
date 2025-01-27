//
//  SettingsView.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 24)
                
                ScrollView(.vertical, showsIndicators: false) {
                                            
                        HStack {
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                VStack(spacing: 20) {
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("prim3"))
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim2")))
                                    
                                    Text("Rate us")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Text("Rate")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(7)
                                        .padding(.horizontal, 7)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 230)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim3")))
                            })
                            
                            Button(action: {
                                
                                guard let url = URL(string: "https://www.termsfeed.com/live/24ae75b8-abf4-4904-828a-72d8d006a6ae") else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                VStack(spacing: 20) {
                                    
                                    Image(systemName: "person.badge.shield.checkmark.fill")
                                        .foregroundColor(Color("prim2"))
                                        .font(.system(size: 27, weight: .regular))
                                    
                                    Text("Rate us")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Text("Rate")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(7)
                                        .padding(.horizontal, 7)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 230)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim3")))
                            })
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
