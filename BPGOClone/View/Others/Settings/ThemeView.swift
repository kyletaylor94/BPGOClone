//
//  ThemeView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

struct ThemeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Válaszd ki a megjelenítési módot")
                .foregroundStyle(.white)
                .bold()
                .font(.title3)
            
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.backGround)
                .frame(width: UIScreen.main.bounds.width - 32, height: 220)
                .overlay {
                    HStack(spacing: 90) {
                        VStack(alignment: .center, spacing: 12){
                            Image(.themelight)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack{
                                Circle()
                                    .fill(.navBG)
                                    .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                                    .frame(height: 15)
                                
                                Text("Világos")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                            }
                        }
                        
                        VStack(alignment: .center,spacing: 12) {
                            Image(.themedark)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            HStack{
                                Circle()
                                    .fill(.navBG)
                                    .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                                    .frame(height: 15)
                                
                                Text("Sötét")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
            
            CustomToggleButton(height: 113, title: "Automatikus", subTitle: "Az alkalmazás megjelenése követni fogja a telefonod beállítását", isOn: .constant(false))
        }
    }
}

#Preview {
    ZStack{
        Color.navBG.ignoresSafeArea()
        ThemeView()
    }
}
