//
//  LanguageView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

enum SelectedLanguage: String, CaseIterable, Identifiable {
    case systemlanguage = "Rendszernyelv"
    case hungarian = "Magyar"
    case english = "English"
    var id: String { return self.rawValue }
}

struct LanguageView: View {
    @State private var selectedLanguage: SelectedLanguage = .systemlanguage
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 20) {
                Text("Válaszd ki az alkalmazás nyelvét")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                
                ForEach(SelectedLanguage.allCases) { language in
                    HStack{
                        Button {
                            selectedLanguage = language
                        } label: {
                            Circle()
                                .fill(.navBG)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                                .frame(height: 20)
                                .overlay {
                                    Circle()
                                        .frame(height: 10)
                                        .opacity(selectedLanguage == language ? 1 : 0)
                                }
                            
                            Text(language.rawValue)
                        }

                    }
                    .foregroundStyle(.white)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ZStack{
        Color.navBG.ignoresSafeArea()
        LanguageView()
    }
}
