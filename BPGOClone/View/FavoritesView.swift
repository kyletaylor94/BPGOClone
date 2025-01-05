//
//  FavoritesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 04..
//

import SwiftUI

struct FavoritesView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        ZStack {
            Color.backGround
                .ignoresSafeArea()
         
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
                SelectorView(selectedIndex: $selectedIndex)
                    .padding(.top, -130)
                
                VStack{
                    switch selectedIndex {
                    case 0:
                        VStack(spacing: 12) {
                            
                            Circle()
                                .frame(width: 220, height: 220)
                                .foregroundColor(.black)
                            
                            Text("Állítsd be kedvenc megállóidat!")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .bold()
                            
                            Text("Egy kattintással megnézheted,mikor indulnak a járatok az adott megállóból.")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .padding()
                            
                            Spacer()
                            
                            Button {
                                //add new
                            } label: {
                                RoundedRectangle(cornerRadius: 18)
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                    .foregroundStyle(.button)
                                    .overlay {
                                        Text("Új megálló hozzáadása")
                                            .foregroundStyle(.black)
                                            .font(.title3)
                                    }
                            }
                            .padding(.top, 30)
                        }
                        .multilineTextAlignment(.center)
                    case 1:
                        Text("vagy ne bánja a geci")
                    default:
                        EmptyView()
                    }
                }

                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Kedvencek")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}


#Preview {
    NavigationStack{
        FavoritesView()
    }
}
