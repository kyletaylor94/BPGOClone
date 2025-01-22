//
//  HowAppDoesWorkView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum HowMobileTicketWorksSection: Int, Identifiable, CaseIterable, HowDoesItWorkSection {
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


enum HowAppDoesWorkSection: Int, Identifiable, CaseIterable, HowDoesItWorkSection {
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
    let howAppDoesWork: Bool
    @State private var currentIndex: HowAppDoesWorkSection = .first
    @State private var currentIndex2: HowMobileTicketWorksSection = .first
    
    
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack{
                if !howAppDoesWork {
                    HowDoesItWorkTest(
                        sections: HowMobileTicketWorksSection.allCases,
                        currentIndex: $currentIndex2,
                        isAppWork: false
                    )
                    
                    Button {
                        if currentIndex2 == .fifth {
                            dismiss()
                        }
                        if currentIndex2.rawValue < HowMobileTicketWorksSection.allCases.count - 1 {
                            withAnimation {
                                currentIndex2 = HowMobileTicketWorksSection(rawValue: currentIndex.rawValue + 1)!
                            }
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .foregroundStyle(.button)
                    .overlay {
                        Text(currentIndex2 == .fifth ? "Bezárás" : "Következő")
                            .bold()
                            .font(.title3)
                    }
                    
                } else {
                    HowDoesItWorkTest(
                        sections: HowAppDoesWorkSection.allCases,
                        currentIndex: $currentIndex,
                        isAppWork: true
                    )
                    
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
            }
        }
    }
}

#Preview {
    NavigationStack{
        HowAppDoesWorkView(howAppDoesWork: false)
    }
}
