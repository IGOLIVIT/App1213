//
//  RestaurantsView.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct RestaurantsView: View {
    
    @StateObject var viewModel = RestaurantsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add restaurants +")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .padding(8)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                
                if viewModel.restaurants.isEmpty {
                    
                    VStack(spacing: 18) {
                        
                        Image("Empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 230)
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 26, weight: .bold))
                        
                        Text("You haven't added any restaurants")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(.vertical, 50)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 14) {
                            
                            ForEach(viewModel.restaurants, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedRest = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Image(index.rePhoto ?? "")
                                            .resizable()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 200)
                                            .overlay(
                                            
                                                VStack {
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "arrow.up.right")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .medium))
                                                        .padding(8)
                                                        .background(Circle().fill(Color("prim3")))
                                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                                        .padding()
                                                }
                                            )
                                        
                                        HStack {
                                            
                                            Text(index.reNF ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 22, weight: .bold))
                                            
                                            Spacer()
                                            
                                            if index.reRate ?? "" == "1" {
                                                
                                                HStack {
                                                    
                                                    Image("fs")
                                                    
                                                    Image("es")
                                                    
                                                    Image("es")

                                                    Image("es")

                                                    Image("es")

                                                }
                                                
                                            } else if index.reRate ?? "" == "2" {
                                                
                                                HStack {
                                                    
                                                    Image("fs")
                                                    
                                                    Image("fs")

                                                    Image("es")

                                                    Image("es")

                                                    Image("es")
                                                    
                                                }
                                                
                                            } else if index.reRate ?? "" == "3" {
                                                
                                                HStack {
                                                    
                                                    Image("fs")
                                                    
                                                    Image("fs")

                                                    Image("fs")

                                                    Image("es")

                                                    Image("es")
                                                    
                                                }
                                                
                                            } else if index.reRate ?? "" == "4" {
                                                
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
                                        }
                                    }
                                })
                            }
                        }
                    }
                    
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchRests()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRest(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RestDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    RestaurantsView()
}
