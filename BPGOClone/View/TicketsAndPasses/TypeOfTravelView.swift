//
//  TypeOfTravelView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 13..
//

import SwiftUI

enum TypeOfTravelSection: String, Identifiable, CaseIterable {
    case localtransport = "Helyi közlekedés"
    case intercitytransport = "Helyközi közlekedés"
    
    var captionOne: String {
        switch self {
        case .localtransport:
            return "Városon belüli közlekedés"
        case .intercitytransport:
            return "Települések közötti\n(távolsági) közlekedés"
        }
    }
    
    var captionTwo: String {
        switch self {
        case .localtransport:
            return "Több mint 70 településen váltható elektronikus jegy"
        case .intercitytransport:
            return "Többféle szolgáltató jegyei és bérletei elérhetők (pl. GYSEV)"
        }
    }
    
    var id: String { return self.rawValue }
}

struct TypeOfTravelView: View {
    @State private var selectedSection: TypeOfTravelSection = .localtransport
    var body: some View {
        VStack(spacing: 5) {
            CustomNavTitle(title: "Közlekedés típusa", dismissAvailable: true)
            
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                    .frame(height: 850)
                    .foregroundStyle(.backGround)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    ForEach(TypeOfTravelSection.allCases) { section in
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: UIScreen.main.bounds.width - 32 ,height: section == .localtransport ? 140 : 165)
                            .foregroundStyle(.customBlackWhite)
                            .overlay {
                                HStack(alignment: .top, spacing: 20) {
                                    Circle()
                                        .stroke(.black,style: StrokeStyle(lineWidth: 3))
                                        .frame(height: 20)
                                        .overlay {
                                            Circle()
                                                .foregroundStyle(.black)
                                                .frame(height: 12)
                                        }
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text(section.rawValue)
                                            .foregroundStyle(.black)
                                            .bold()
                                        
                                        HStack {
                                            Circle()
                                                .frame(height: 5)
                                            
                                            Text(section.captionOne)
                                        }
                                        .foregroundStyle(.black)
                                        
                                        
                                        HStack{
                                            Circle()
                                                .frame(height: 5)
                                                .foregroundStyle(.black)
                                                .offset(y: -10)
                                            
                                            Text(section.captionTwo)
                                            
                                        }
                                        .foregroundStyle(.black)
                                        
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                    }
                }
                .padding(.top, 30)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TypeOfTravelView()
}
