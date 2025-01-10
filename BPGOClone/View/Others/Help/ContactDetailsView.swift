//
//  ContactDetailsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

struct ContactDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: -120) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
                VStack(spacing: 3){
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24,bottomLeading: 0, bottomTrailing: 0, topTrailing: 24))
                        .fill(.navBG)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 90)
                        .overlay {
                            HStack(spacing: 16) {
                                Image(systemName: "envelope")
                                    .font(.title3)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("E-mail")
                                    Text("bkk@bkk.hu")
                                }
                                
                                Spacer()
                            }
                            .foregroundStyle(.white)
                            .padding()
                        }
                    
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0,bottomLeading: 0, bottomTrailing: 0, topTrailing: 0))
                        .fill(.navBG)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 90)
                        .overlay {
                            HStack(spacing: 16) {
                                Image(systemName: "iphone")
                                    .font(.title3)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Telefonszám")
                                    Text("+36 1 3 255 255")
                                }
                                
                                Spacer()
                            }
                            .foregroundStyle(.white)
                            .padding()
                        }
                    
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0,bottomLeading: 24, bottomTrailing: 24, topTrailing: 0))
                        .fill(.navBG)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 90)
                        .overlay {
                            HStack(spacing: 16) {
                                Image(systemName: "map")
                                    .font(.title3)
                                //linkbutton!
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("BKK Ügyfélközpontok")
                                    Text("Részletes információk")
                                }
                                
                                Spacer()
                            }
                            .foregroundStyle(.white)
                            .padding()
                        }
                    
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundStyle(.white)

                }
                
                ToolbarItem(placement: .principal) {
                    Text("Elérhetőségek")
                        .font(.title3)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        ContactDetailsView()
    }
}
