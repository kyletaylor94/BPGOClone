//
//  PassesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 13..
//

import SwiftUI

enum AdultSection: String, TicketSection, CaseIterable {
    case halfmonth = "Félhavi (15 napos) Budapest-bérlet"
    case month = "Havi Budapest bérlet"
    case capitalpass = "Pest vármegyebérlet teljesárú"
    case countypass = "Országbérlet teljesárú"
    case quarterlypass = "Negyedéves Budapest-bérlet"
    case yearlydiscountpass = "Kedvezményes éves Budapest-bérlet"
    
    var iconName: String {
        switch self {
        case .halfmonth:
            return "house"
        case .month:
            return "house"
            
        case .capitalpass:
            return "house"
            
        case .countypass:
            return "house"
            
        case .quarterlypass:
            return "house"
            
        case .yearlydiscountpass:
            return "house"
            
        }
    }
    
    var priceLabel: Int {
        switch self {
        case .halfmonth:
            return 5950
        case .month:
            return 8950
        case .capitalpass:
            return 9450
        case .countypass:
            return 18900
        case .quarterlypass:
            return 26850
        case .yearlydiscountpass:
            return 99950
        }
    }
    
    var id: String { return self.rawValue }
}

enum StudentSection: String, TicketSection, CaseIterable {
    case capitaldiscountpass = "Pest vármegyebérlet kedvezményes"
    case countydiscountpass = "Országbérlet kedvezményes"
    case monthcapitalpass = "Havi Budapest-bérlet közoktatásban tanulóknak"
    
    var iconName: String {
        switch self {
        case .capitaldiscountpass:
            return "house"
        case .countydiscountpass:
            return "house"
            
        case .monthcapitalpass:
            return "house"
            
        }
    }
    
    var priceLabel: Int {
        switch self {
        case .capitaldiscountpass:
            return 945
        case .countydiscountpass:
            return 1890
        case .monthcapitalpass:
            return 3450
        }
    }
    
    var id: String { return self.rawValue }
}

enum WithChildSection: String, TicketSection, CaseIterable {
    case monthcapital = "Havi Budapest-bérlet kisgyermeseknek"
    
    var iconName: String {
        return "house"
    }
    
    var priceLabel: Int {
        return 3450
    }
    var id: String { return self.rawValue }
}

enum PassesSection: String, Identifiable, CaseIterable {
    case adult = "Felnőtt (teljes árú)"
    case student = "Általános / középsikolai diák"
    case universitystudent = "Felsőoktatási diák"
    case pensioner = "Nyugdíjas"
    case havechild = "Kisgyerekes"
    
    var iconName: String {
        switch self {
        case .adult:
            return "house"
        case .student:
            return "house"
            
        case .universitystudent:
            return "house"
            
        case .pensioner:
            return "house"
            
        case .havechild:
            return "house"
            
        }
    }
    
    var sheetText: String {
        switch self {
        case .adult, .student, .universitystudent, .pensioner, .havechild:
            return rawValue
        }
    }
    
    var sheetSubtext: String {
        switch self {
        case .adult:
            return "A bérlet csak a megfelelő igazolvánnyal (személyi, jogosítvány, útlevél) együtt használható."
            
        case .student:
            return "13 éves kor alatt a BKK járatain az utazás ingyenes magyar diákigazolvánnyal, Budapest közigazgatási határán belül. A Pest vármegye- és országbérletek nappali vagy esti tagozatos magyar diákigazolvánnyal együtt használhatók. Levelező tagozaton tanulóknak felnőtt (teljes árú) bérletet kell váltaniuk. Az Európai Unióban, az Európai Gazdasági Térségben (EGT), illetve Svácjban kiállított diákgazolványokkal rendelkezők a Budapest- bérleteket veghetik igénybe."
            
        case .universitystudent:
            return "A Pest vármegye-és országbérletek nappali vagy esti tagozatos magyar diákigazolvnnyal együtt használhatók. Levelező tagozaton tanulóknak felnőtt (teljes árú) bérletet kell váltaniuk. Az Európai Unióban, az Európai Gazdasági Térségben (EGT), illetve Svájcban kiálíltott diákigazolvánnyokkal rendelkezők a Budapest-bérleteket vehetik igénybe."
            
        case .pensioner:
            return "Ez a bérlettípus a 65 év alattii nyugdíjasok részére szól, és nyugdíjas bérletigazolvánnyal együtt használható, amely bármelyik személyes BKK jegy-é s bérletpénztárban, vagy BKK Ügyfélközpontban igényelhető."
            
        case .havechild:
            return "Ez a bérlettípus a csak kisgyerekes bérletigazolvánnyal együtt használható, amely bármelyik személyes BKK jegy- és bérletpénztárban, vagy Ügyfélközpontban igényelhető."
            
        }
    }
    
    var id: String { return self.rawValue }
}



struct PassesView: View {
    @State private var informationPresented = false
    @State private var selectedIndex = 0
    
    //sheets
    @State private var sheetOneIsActive = false
    @State private var sheetTwoIsActive = false
    @State private var sheetThreeIsActive = false
    @State private var sheetFourIsActive = false
    @State private var sheetFiveIsActive = false
    @State private var sheetSixIsActive = false
    
    
    //disclosures
    @State private var disclosureOne = false
    @State private var disclosureTwo = false
    @State private var disclosureThree = false
    @State private var disclosureFour = false
    @State private var disclosureFive = false
    
    @State private var disclosureSix = false
    @State private var disclosureSeven = false
    
    
    var body: some View {
        VStack(spacing: 5) {
            CustomNavTitle(title: "Bérletek")
            
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                    .frame(height: 850)
                    .foregroundStyle(.backGround)
                    .ignoresSafeArea()
                
                SelectorView(selectedIndex: $selectedIndex, sections: PassesSelectorSection.allCases)
                
                VStack{
                    ScrollView{
                        VStack(spacing: 40) {
                            HStack{
                                Image(systemName: "info.circle")
                                if selectedIndex == 0 {
                                    Text("Magászemély nevére kérhető számla")
                                } else {
                                    Text("Cég nevére kérhető számla")
                                }
                            }
                            .foregroundStyle(.blue)
                            
                            InfoBox(informationPresented: $informationPresented, width: UIScreen.main.bounds.width - 74)
                            
                            VStack(spacing: 3) {
    //MARK: - disclosures
    //MARK: - FIXME: put radius to the enum!
                                if selectedIndex == 0 {
                                    ForEach(PassesSection.allCases) { section in
                                        switch section {
                                        case .adult:
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 24,
                                                bottomLeading: 24,
                                                bottomTrailing: 0,
                                                disclosureHeight: 550,
                                                disclosureIsOpen: $disclosureOne,
                                                sheetIsActive: $sheetOneIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: AdultSection.allCases
                                            )
                                            
                                        case .student:
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 0,
                                                bottomLeading: 24,
                                                bottomTrailing: 0,
                                                disclosureHeight: 310,
                                                disclosureIsOpen: $disclosureTwo,
                                                sheetIsActive: $sheetTwoIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: StudentSection.allCases
                                            )
                                            
                                            
                                        case .universitystudent:
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 0,
                                                bottomLeading: 24,
                                                bottomTrailing: 0,
                                                disclosureHeight: 310,
                                                disclosureIsOpen: $disclosureThree,
                                                sheetIsActive: $sheetThreeIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: StudentSection.allCases
                                            )
                                            
                                            
                                        case .pensioner:
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 0,
                                                bottomLeading: 24,
                                                bottomTrailing: 0,
                                                disclosureHeight: 310,
                                                disclosureIsOpen: $disclosureFour,
                                                sheetIsActive: $sheetFourIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: StudentSection.allCases
                                            )
                                            
                                            
                                        case .havechild:
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 0,
                                                bottomLeading: 24,
                                                bottomTrailing: 24,
                                                disclosureHeight: 150,
                                                disclosureIsOpen: $disclosureFive,
                                                sheetIsActive: $sheetFiveIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: WithChildSection.allCases
                                            )
                                            
                                        }
                                    }
                                } else {
                                    ForEach(PassesSection.allCases.filter({ $0 == .adult || $0 == .havechild })) { section in
                                        
                                        if section == .adult {
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 24,
                                                bottomLeading: 24,
                                                bottomTrailing: 0,
                                                disclosureHeight: 550,
                                                disclosureIsOpen: $disclosureOne,
                                                sheetIsActive: $sheetOneIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: AdultSection.allCases
                                            )
                                            
                                        } else {
                                            
                                            PassesDisclosureButton(
                                                topLeading: 24,
                                                topTrailing: 0,
                                                bottomLeading: 24,
                                                bottomTrailing: 24,
                                                disclosureHeight: 150,
                                                disclosureIsOpen: $disclosureFive,
                                                sheetIsActive: $sheetFiveIsActive,
                                                sheetText: section.sheetText,
                                                sheetSubtext: section.sheetSubtext,
                                                iconName: section.iconName,
                                                title: section.rawValue,
                                                sections: WithChildSection.allCases
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .safeAreaPadding(.bottom, 50)
                }
                .padding(.top, 80)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PassesView()
}

