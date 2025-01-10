//
//  LanguageView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

struct LanguageView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 20) {
                Text("Válaszd ki az alkalmazás nyelvét")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                
                HStack{
                    Circle()
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                        .frame(height: 20)
                    Text("Rendszernyelv")
                }
                .foregroundStyle(.white)
                HStack{
                    Circle()
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                        .frame(height: 20)
                    Text("Magyar")
                }
                .foregroundStyle(.white)
                
                HStack{
                    Circle()
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                        .frame(height: 20)
                    Text("English")
                }
                .foregroundStyle(.white)
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
