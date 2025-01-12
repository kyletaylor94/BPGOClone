//
//  AddNewStopView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 12..
//

import SwiftUI

struct AddNewStopView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack{
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 24))
                    .foregroundStyle(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                    .overlay {
                        VStack(alignment: .center) {
                            HStack{
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                
                                Text("Kedvenc megálló hozzáadása")
                                    .font(.title2)
                                    .foregroundStyle(.customBlackWhite)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                
                
                HStack{
                    Text("Add meg a megálló nevét")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Spacer()
                }
                .padding(.horizontal)

                RoundedRectangle(cornerRadius: 16)
                    .fill(.navBG)
                    .stroke(.white, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50, alignment: .center)
                    .overlay {
                        TextField("", text: $text)
                            .padding()
                    }
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 100)
                            .foregroundStyle(.navBG)
                            .overlay {
                                VStack(spacing: 15) {
                                    HStack{
                                        ZStack{
                                            Circle()
                                                .fill(.black)
                                                .stroke(.yellow, style: StrokeStyle(lineWidth: 5))
                                                .frame(height: 15)
                                            
                                            Circle()
                                                .stroke(style: StrokeStyle())
                                                .frame(height: 22)
                                            
                                            Image(systemName: "triangle.fill")
                                                .font(.system(size: 8))
                                                .offset(y: -15)
                                                .rotationEffect(.degrees(190))
                                        }
                                        
                                        Text("Királyhágó tér")
                                            .bold()
                                            .foregroundStyle(.white)
                                        
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    HStack{
                                        Circle()
                                            .frame(height: 25)
                                            .foregroundStyle(.yellow)
                                            .overlay {
                                                Image(systemName: "bus")
                                                    .foregroundStyle(.black)
                                                    .font(.subheadline)
                                            }
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 60, height: 25)
                                            .foregroundStyle(.yellow)
                                            .overlay {
                                                Text("1")
                                                    .foregroundStyle(.black)
                                            }
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 60, height: 25)
                                            .foregroundStyle(.yellow)
                                            .overlay {
                                                Text("1")
                                                    .foregroundStyle(.black)
                                            }
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                            }
                    }
                }
                .padding(.top)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddNewStopView()
}
