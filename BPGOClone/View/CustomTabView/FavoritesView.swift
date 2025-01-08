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
        VStack(spacing: 12) {
            UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                .fill(.navBG)
                .frame(width: UIScreen.main.bounds.width, height: 100)
                .ignoresSafeArea(edges: .top)
                .overlay {
                    VStack(alignment: .center) {
                        Text("Kedvencek")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                        Spacer()
                    }
                }
            
            SelectorView(selectedIndex: $selectedIndex)
                .padding(.top, -50)
            
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
                        VStack{
                            Button {
                                //add new
                            } label: {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.button)
                                    .stroke(.white, style: StrokeStyle(lineWidth: 1.0))
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                    .overlay {
                                        Text("Új megálló hozzáadása")
                                            .foregroundStyle(.black)
                                            .font(.title3)
                                            .bold()
                                    }
                            }
                        }
                        .padding(.bottom, 70)
                    }
                    .multilineTextAlignment(.center)
                case 1:
                    Text("vagy ne bánja a geci")
                default:
                    Color.backGround.ignoresSafeArea()
                }
            }
            Spacer()
        }
        .background(Color.backGround.ignoresSafeArea()) // Háttér kitöltése

    }
}


#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        FavoritesView()
    }
}
