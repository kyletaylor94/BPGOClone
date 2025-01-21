//
//  BillingAdressView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

enum BillingAdressSection: String, CaseIterable, Identifiable {
    case privateperson = "Magánszemély"
    case company = "Cég"
    
    var iconName: String {
        switch self {
        case .privateperson:
            return "person"
        case .company:
            return "building"
        }
    }
    var id: String { return self.rawValue }
}

struct BillingAdressView: View {
    @State private var isPickerIsPresented: Bool = false
    @State private var selectedBillingAddressSection: BillingAdressSection? = nil
    @State private var selectedBillingCompanySection: PreBillingAdressCompanyFormSection? = nil
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Számlázási cím hozzáadása", dismissAvailable: true)
                .ignoresSafeArea()
            
            ScrollView{
                Text("Kinek a részére állítsuk ki a számlákat?")
                    .bold()
                    .foregroundStyle(.customBlackWhite)
                    .font(.title3)
                
                HStack{
                    ForEach(BillingAdressSection.allCases) { section in
                        Button {
                            selectedBillingAddressSection = section
                        } label: {
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 200, height: 120)
                                .foregroundStyle(.navBG)
                                .overlay {
                                    VStack(spacing: 5) {
                                        HStack(alignment: .top) {
                                            Circle()
                                                .stroke(style: StrokeStyle())
                                                .frame(height: 20)
                                                .overlay {
                                                    if selectedBillingAddressSection == section {
                                                        Circle()
                                                            .frame(height: 10)
                                                    }
                                                }
                                            
                                            Text(section.rawValue)
                                                .font(.subheadline)
                                            
                                            Spacer()
                                        }
                                        .padding()
                                        
                                        Image(systemName: section.iconName)
                                            .font(.largeTitle)
                                    }
                                }
                                .shadow(color: selectedBillingAddressSection == section ? .white.opacity(0.4) : .clear, radius: 5, x: 0, y: 5)
                        }
                        .foregroundStyle(.primary)
                    }
                }
                
                switch selectedBillingAddressSection {
                case .privateperson:
                    BillingAdressPrivatePersonForm(isPickerPresented: $isPickerIsPresented)
                    
                case .company:
                    PreBillingAdressCompanyForm(selectedType: $selectedBillingCompanySection, isPickerPresented: $isPickerIsPresented)
                  
                case nil:
                    Color.backGround.ignoresSafeArea()
                }
            }
            .padding(.top, 90)
            .safeAreaPadding(.bottom)
            .navigationBarBackButtonHidden()
        }
    }
}


enum PreBillingAdressCompanyFormSection: String, Identifiable, CaseIterable {
    case home = "Belföld"
    case foreign = "Külföld"
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .foreign:
            return "globe"
        }
    }
    var id: String { return self.rawValue }
}

struct PreBillingAdressCompanyForm: View {
    @Binding var selectedType: PreBillingAdressCompanyFormSection?
    @Binding var isPickerPresented: Bool
    var body: some View {
        VStack{
            Text("Hol található a cég székhelye?")
            HStack{
                ForEach(PreBillingAdressCompanyFormSection.allCases) { section in
                    Button {
                        selectedType = section
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 200, height: 120)
                            .foregroundStyle(.navBG)
                            .overlay {
                                VStack(spacing: 5) {
                                    HStack(alignment: .top) {
                                        Circle()
                                            .stroke(style: StrokeStyle())
                                            .frame(height: 20)
                                            .overlay {
                                                if selectedType == section {
                                                    Circle()
                                                        .frame(height: 10)
                                                }
                                            }
                                        
                                        Text(section.rawValue)
                                            .font(.subheadline)
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    
                                    Image(systemName: section.iconName)
                                        .font(.largeTitle)
                                }
                            }
                            .shadow(color: selectedType == section ? .white.opacity(0.4) : .clear, radius: 5, x: 0, y: 5)
                            .foregroundStyle(.customBlackWhite)
                    }
                }
            }
            
            switch selectedType {
            case .home:
                VStack(alignment: .leading, spacing: 12) {
                    Text("Számlázási e-mai-cím")
                        .bold()
                        .foregroundStyle(.customBlackWhite)
                    
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black)
                        .stroke(.white, style: StrokeStyle())
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    
                    Text("Adószám")
                        .bold()
                        .foregroundStyle(.customBlackWhite)
                    
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.navBG)
                        .stroke(.white, style: StrokeStyle())
                        .frame(width: UIScreen.main.bounds.width - 32, height: 45)
                    
                    Text("Formátum: 0000000-0-00")
                        .foregroundStyle(.gray)
                        .font(.caption)
                    
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.navBG)
                        .stroke(.white, style: StrokeStyle())
                        .frame(width: 200, height: 40)
                        .overlay {
                            Text("Cégadatok betöltése")
                                .bold()
                                .foregroundStyle(.customBlackWhite)
                        }
                        
                }
                .padding()
                
            case .foreign:
                BillingAdressPrivatePersonForm(isPickerPresented: $isPickerPresented)

            case nil:
                Color.backGround.ignoresSafeArea()
            }
        }
        .padding(.top, 30)
    }
}



#Preview {
    BillingAdressView()
}
