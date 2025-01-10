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
                            .foregroundStyle(.tabButton)
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
                    FavoriteCell(image: .stops, title: "Állítsd be kedvenc megállóidat!", subTitle: "Egy kattintással megnézheted,mikor indulnak a járatok az adott megállóból.", buttonTitle: "Új megálló hozzáadása") {
                        //
                    }
                case 1:
                    FavoriteCell(image: .departures, title: "Álltsd be a kedvenc járataidat, és kérj személyre szabott értesítést!", subTitle: "Tájékoztatunk a kiválasztott szakaszon az adott időszaki forgalmi változásairól.", buttonTitle: "Új járat hozzáadása") {
                        //
                    }
                default:
                    Color.backGround.ignoresSafeArea()
                }
            }
            Spacer()
        }
        .background(Color.backGround.ignoresSafeArea())
    }
}


#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        FavoritesView()
    }
}


