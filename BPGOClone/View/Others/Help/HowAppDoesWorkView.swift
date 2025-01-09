//
//  HowAppDoesWorkView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum HowAppDoesWorkSection: Int, Identifiable, CaseIterable {
    case first
    case second
    case third
    case fourth
    
    var image: ImageResource {
        switch self {
        case .first:
            return .helpapp1
        case .second:
            return .helpapp2
        case .third:
            return .helpapp3

        case .fourth:
            return .helpapp4
        }
    }
    
    var title: String {
        switch self {
        case .first:
            return "Vedd meg az appban jegyedet vagy bérletedet!"
        case .second:
            return "Tudd meg, éppen hol van a járatod."
        case .third:
            return "Személyre szabott közlekedési információk"
        case .fourth:
            return "Jelölések az alkalmazásban"
        }
    }
    
    var subTitle: String {
        switch self {
        case .first:
            return "Nem kell automatát vagy pénztárt keresned,a BudapestGO appban bármikor vehetsz vonaljegyet is."
        case .second:
            return "Élőben követheted, merre jár, és mikor érkezik a megállóba."
        case .third:
            return "Azonnal, személyre szabottan értesítünk a közösségi közlekedés forgalmi változásairól."
        case .fourth:
            return "Hogy könnyebben eligazodj a jelmagyarázatok között, a Továbbiak menüpontban a Jelmagyarázatba összegyűjtöttünk minden infót."
        }
    }
    
    var id: Int { return self.rawValue }
}

struct HowAppDoesWorkView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentIndex: HowAppDoesWorkSection = .first
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: 70) {
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .foregroundStyle(.white)

                }
                .padding()
                
                Spacer()
                
                TabView(selection: $currentIndex) {
                    ForEach(HowAppDoesWorkSection.allCases) { section in
                        VStack(spacing: 20) {
                            Image(section.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200)
                            
                            Text(section.title)
                                .font(.title3)
                                .bold()
                            
                            Text(section.subTitle)
                        }
                        .tag(section)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
                VStack(spacing: 30) {
                    HStack(spacing: 12) {
                        ForEach(0..<4, id: \.self) { index in
                            Circle()
                                .fill(currentIndex.rawValue == index ? .white : .black)
                                .stroke(.gray,style: StrokeStyle())
                                .frame(height: 10)
                        }
                    }
                    
                    Button {
                        if currentIndex == .fourth {
                            dismiss()
                        }
                        if currentIndex.rawValue < HowAppDoesWorkSection.allCases.count - 1 {
                               withAnimation {
                                   currentIndex = HowAppDoesWorkSection(rawValue: currentIndex.rawValue + 1)!
                               }
                           }
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .foregroundStyle(.button)
                    .overlay {
                        Text(currentIndex == .fourth ? "Kedjük el" : "Következő")
                            .bold()
                            .font(.title3)
                    }
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NavigationStack{
        HowAppDoesWorkView()
    }
}
