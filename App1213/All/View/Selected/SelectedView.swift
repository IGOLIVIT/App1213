//
//  SelectedView.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct SelectedView: View {
    
    @StateObject var viewModel = RestaurantsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Selected desserts")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 24)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.foods, id: \.self) { index in
                            
                            VStack(alignment: .leading) {
                                
                                Image(index.fPhoto ?? "")
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 150)
                                
                                Text(index.fNF ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                if index.fRate ?? "" == "1" {
                                    
                                    HStack {
                                        
                                        Image("fs")
                                        
                                        Image("es")
                                        
                                        Image("es")

                                        Image("es")

                                        Image("es")

                                    }
                                    
                                } else if index.fRate ?? "" == "2" {
                                    
                                    HStack {
                                        
                                        Image("fs")
                                        
                                        Image("fs")

                                        Image("es")

                                        Image("es")

                                        Image("es")
                                        
                                    }
                                    
                                } else if index.fRate ?? "" == "3" {
                                    
                                    HStack {
                                        
                                        Image("fs")
                                        
                                        Image("fs")

                                        Image("fs")

                                        Image("es")

                                        Image("es")
                                        
                                    }
                                    
                                } else if index.fRate ?? "" == "4" {
                                    
                                    HStack {
                                        
                                        Image("fs")
                                        
                                        Image("fs")

                                        Image("fs")

                                        Image("fs")

                                        Image("es")
                                        
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Image("fs")
                                        
                                        Image("fs")

                                        Image("fs")

                                        Image("fs")

                                        Image("fs")
                                    }
                                }
                                
                                Text("\(index.fCost ?? "") $")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .semibold))
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim3")))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(7)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                        }
                    })
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchFoods()
        }
    }
}

#Preview {
    SelectedView()
}
