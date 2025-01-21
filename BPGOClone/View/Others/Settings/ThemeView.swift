//
//  ThemeView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

enum ThemeSettings: String, CaseIterable, Identifiable {
    case light = "Világos"
    case dark = "Sötét"
    
    
    var image: ImageResource {
        switch self {
        case .light:
            return .themelight
        case .dark:
            return .themedark
        }
    }
    var id: String { return self.rawValue }
}

struct ThemeView: View {
    @State private var selectedTheme: ThemeSettings = .light
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
                        ForEach(ThemeSettings.allCases) { theme in
                            Button {
                                selectedTheme = theme
                            } label: {
                                VStack(alignment: .center, spacing: 12) {
                                    ZStack{
                                        if selectedTheme == theme {
                                            Rectangle()
                                                .stroke(.gray, style: StrokeStyle(lineWidth: 3))
                                                .frame(width: 70, height: 150)
                                        }
                                        
                                        Image(theme.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 150)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                    
                                    
                                    HStack{
                                        Circle()
                                            .fill(.navBG)
                                            .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                                            .frame(height: 15)
                                            .overlay {
                                                Circle()
                                                    .foregroundStyle(.customBlackWhite)
                                                    .frame(height: 5)
                                                    .opacity(selectedTheme == theme ? 1 : 0)
                                            }
                                        
                                        Text(theme.rawValue)
                                            .foregroundStyle(.white)
                                            .font(.subheadline)
                                    }
                                }
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
