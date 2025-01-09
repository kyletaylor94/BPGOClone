//
//  HowMobileTicketWorksView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

enum HowMobileTicketWorksSection: Int, Identifiable, CaseIterable {
    case first
    case second
    case third
    case fourth
    case fifth
    
    var image: ImageResource {
        switch self {
        case .first:
            return .helpmticket1
        case .second:
            return .helpmticket2
        case .third:
            return .helpmticket3
            
        case .fourth:
            return .helpmticket4
            
        case .fifth:
            return .helpmticket5
        }
    }
    
    var title: String {
        switch self {
        case .first:
            return "Érvényesítés kódbeolvasással"
        case .second:
            return "A vonaljegyet és az időalapú jegyet midnen felszálláskor érvényesíteni kell"
        case .third:
            return "Kódbeolvasás egy gombnyomással"
        case .fourth:
            return "Gyorsabb bérletbemutatás a felszállok gombbal"
        case .fifth:
            return "Nemzeti Mobilfizetési Rendszer viszonteladó"
        }
    }
    
    var subTitle: String {
        switch self {
        case .first:
            return "A kód beolvasásával tudod a jegyet érvényesíteni vagy a bérlet érvényességét igazolni.\n\n Sikeres beolvasás esetén egy animált ábra jelenik meg a képernyőn."
            
        case .second:
            return "A bérletet vagy napijegyet csak az első ajtós felszálláskor vagy a metró bejáratánál kell beolvasnod."
            
        case .third:
            return "A widget funkcióval az app megnyitása nélkül, a kezdőképernyőn eléred a jegyet, bérleted."
            
        case .fourth:
            return "Válaszd ki a felszállást jelző ikont,és azonnal megjenik az animált ábra, amelyet a metróállomáson vagy az első ajtós járatokon kell felmutatnod."
            
        case .fifth:
            return "A BKK Zrt. a Nemzeti Mobilfizetési Zrt. hivatlos viszonteladója"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct HowMobileTicketWorksView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentIndex: HowMobileTicketWorksSection = .first
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Hogyan működik?")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(spacing: 70) {
                TabView(selection: $currentIndex) {
                    ForEach(HowMobileTicketWorksSection.allCases) { section in
                        VStack(spacing: 20) {
                            Image(section.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200)
                            
                            Text(section.title)
                                .font(.title3)
                                .bold()
                            
                            Text(section.subTitle)
                                .padding(.horizontal)
                        }
                        .tag(section)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
                VStack(spacing: 30) {
                    HStack(spacing: 12) {
                        ForEach(0..<5, id: \.self) { index in
                            Circle()
                                .fill(currentIndex.rawValue == index ? .white : .black)
                                .stroke(.gray,style: StrokeStyle())
                                .frame(height: 10)
                        }
                    }
                    
                    Button {
                        if currentIndex == .fifth {
                            dismiss()
                        }
                        if currentIndex.rawValue < HowMobileTicketWorksSection.allCases.count - 1 {
                            withAnimation {
                                currentIndex = HowMobileTicketWorksSection(rawValue: currentIndex.rawValue + 1)!
                            }
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .foregroundStyle(.button)
                    .overlay {
                        Text(currentIndex == .fifth ? "Bezárás" : "Következő")
                            .bold()
                            .font(.title3)
                    }
                    
                    Link(destination: URL(string: "https://bkk.hu/gyik/budapestgo/?frame=1&app=prod")!) {
                        Text("További kérdeseim vannak")
                            .bold()
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                    .opacity(currentIndex == .fifth ? 1 : 0)
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        HowMobileTicketWorksView()
    }
}
