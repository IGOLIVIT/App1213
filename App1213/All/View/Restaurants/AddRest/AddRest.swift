//
//  AddRest.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI

struct AddRest: View {
    
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
                            
                            viewModel.isAdd = false
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
                            
                            ForEach(viewModel.images, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curIm = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curIm.isEmpty {
                                
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
                                
                                Image(viewModel.curIm)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                            }
                        })
                        
                        Text("Name restaurant")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.reNF.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.reNF)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))

                        Text("Comment")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.reCom.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.reCom)
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
                                    
                                    viewModel.curRate = star
                                    
                                }, label: {
                                    
                                    Image(star <= viewModel.curRate ? "fs" : "es")
                                })
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 50)
                        
                        Button(action: {
                            
                            viewModel.reRate = String("\(viewModel.curRate)")
                            
                            viewModel.rePhoto = viewModel.curIm
                            
                            viewModel.addRest()
                            
                            viewModel.reCom = ""
                            viewModel.reNF = ""
                            viewModel.curIm = ""
                            viewModel.curRate = 1
                            
                            viewModel.fetchRests()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
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
    AddRest(viewModel: RestaurantsViewModel())
}
