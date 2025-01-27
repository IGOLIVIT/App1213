//
//  AddFood.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct AddFood: View {

    @StateObject var viewModel: RestaurantsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Restaurant")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddFood = false
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
                    
                    VStack(spacing: 16) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.imagesFood, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curImFood = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curImFood.isEmpty {
                                
                                VStack {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 24, weight: .regular))
                                    
                                    Text("Add image")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                                
                            } else {
                                
                                Image(viewModel.curImFood)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                            }
                        })
                        
                        Text("Name food")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.fNF.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.fNF)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        
                        Text("Cost")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.fCost.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.fCost)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        
                        
                        Text("How do you rate a food?")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(1...5, id: \.self) { star in
                                
                                Button(action: {
                                    
                                    viewModel.curRateFood = star
                                    
                                }, label: {
                                    
                                    Image(star <= viewModel.curRateFood ? "fs" : "es")
                                })
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 50)
                        
                        Button(action: {
                            
                            viewModel.fRate = String("\(viewModel.curRateFood)")
                            
                            viewModel.fPhoto = viewModel.curImFood
                            
                            viewModel.fRest = viewModel.selectedRest?.reNF ?? ""
                            
                            viewModel.addFood()
                            
                            viewModel.fCost = ""
                            viewModel.fNF = ""
                            viewModel.curImFood = ""
                            viewModel.curRateFood = 1
                            
                            viewModel.fetchFoods()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddFood = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 13).fill(Color("prim")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddFood(viewModel: RestaurantsViewModel())
}
