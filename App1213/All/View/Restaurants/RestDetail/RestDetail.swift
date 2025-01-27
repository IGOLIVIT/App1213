//
//  RestDetail.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct RestDetail: View {
    
    @StateObject var viewModel: RestaurantsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedRest?.reNF ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .medium))
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 22) {
                        
                        Image(viewModel.selectedRest?.rePhoto ?? "")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                        
                        Text("How do you rate a restaurant?")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        HStack {
                            
                            if viewModel.selectedRest?.reRate ?? "" == "1" {
                                
                                HStack {
                                    
                                    Image("fs")
                                    
                                    Image("es")
                                    
                                    Image("es")

                                    Image("es")

                                    Image("es")

                                }
                                
                            } else if viewModel.selectedRest?.reRate ?? "" == "2" {
                                
                                HStack {
                                    
                                    Image("fs")
                                    
                                    Image("fs")

                                    Image("es")

                                    Image("es")

                                    Image("es")
                                    
                                }
                                
                            } else if viewModel.selectedRest?.reRate ?? "" == "3" {
                                
                                HStack {
                                    
                                    Image("fs")
                                    
                                    Image("fs")

                                    Image("fs")

                                    Image("es")

                                    Image("es")
                                    
                                }
                                
                            } else if viewModel.selectedRest?.reRate ?? "" == "4" {
                                
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
                        
                        Text("Comment")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text(viewModel.selectedRest?.reCom ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 13).stroke(Color("prim3")))
                            .padding(1)
                        
                        HStack {
                            
                            Text("What did you eat?")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddFood = true
                                }
                                
                            }, label: {
                                
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(8)
                                    .background(Circle().fill(Color("prim3")))
                            })
                        }
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.foods.filter({($0.fRest ?? "") == viewModel.selectedRest?.reNF ?? ""}), id: \.self) { index in
                            
                                VStack(alignment: .leading) {
                                    
                                    Image(index.fPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                    
                                    Text(index.fNF ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                            }
                        })
                            
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchFoods()
        }
        .sheet(isPresented: $viewModel.isAddFood, content: {
            
            AddFood(viewModel: viewModel)
        })
    }
}

#Preview {
    RestDetail(viewModel: RestaurantsViewModel())
}
