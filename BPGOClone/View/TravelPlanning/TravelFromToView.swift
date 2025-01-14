//
//  TravelFromToView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum TraverlFromToSection: Int, CaseIterable, Identifiable {
    case places
    case plans
    case departures
    
    var titleName: String {
        switch self {
        case .places:
            return "Helyek"
        case .plans:
            return "Útitervek"
        case .departures:
            return "Járatok"
        }
    }
    var id: Int { return self.rawValue }
}

struct TravelFromToView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedIndex = 0
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: -35) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 24))
                    .frame(height: 280)
                    .foregroundStyle(.navBG)
                    .ignoresSafeArea()
                    .overlay {
                        VStack {
                            HStack{
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "chevron.left")
                                }
                                
                                Spacer()
                                
                                Text("Utazástervezés")
                                    .font(.title3)
                                
                                Spacer()
                                
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                }
                            }
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading) {
                                Text("Hova szeretnél menni?")
                                
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(.black)
                                    .stroke(.gray, style: StrokeStyle(lineWidth: 1))
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                
                                Text("Keress járatra, címre, megállóra")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                
                                HStack(spacing: 10) {
                                    Circle()
                                        .fill(.black)
                                        .stroke(.gray, style: StrokeStyle(lineWidth: 2.0))
                                        .frame(height: 40)
                                        .overlay {
                                            Image(systemName: "pencil")
                                                .foregroundStyle(.white)
                                        }
                                    
                                    Capsule()
                                        .fill(.black)
                                        .stroke(.gray, style: StrokeStyle(lineWidth: 2.0))
                                        .frame(width: 80, height: 35)
                                        .overlay {
                                            Text("Otthon")
                                        }
                                    
                                    Capsule()
                                        .fill(.black)
                                        .stroke(.gray, style: StrokeStyle(lineWidth: 2.0))
                                        .frame(width: 110, height: 35)
                                        .overlay {
                                            Text("Munkahely")
                                        }
                                    
                                    Capsule()
                                        .fill(.black)
                                        .stroke(.gray, style: StrokeStyle(lineWidth: 2.0))
                                        .frame(width: 140, height: 35)
                                        .overlay {
                                            Text("Mentett helyek")
                                        }
                                }
                            }
                            .padding(.top)
                            
                            Spacer()
                        }
                        .padding()
                        .bold()
                        .foregroundStyle(.white)
                        
                        
                    }
                
                VStack{
                    Capsule()
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 2.0))
                        .frame(width: UIScreen.main.bounds.width - 10, height: 48)
                        .overlay {
                            HStack{
                                Image(systemName: "map")
                                Text("Kijelölés térképen")
                                
                                Spacer()
                            }
                            .font(.title3)
                            .padding()
                            .foregroundStyle(.white)
                        }
                }
                
                VStack(alignment: .center) {
                    HStack{
                        Text("Korábbi keresések")
                            .foregroundStyle(.white)
                            .bold()
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.leading, 5)
                    
                    HStack(spacing: 50) {
                        ForEach(TraverlFromToSection.allCases) { section in
                            Button(action: {
                                withAnimation(.snappy) {
                                    selectedIndex = section.rawValue
                                }
                            }, label: {
                                Text(section.titleName)
                                    .padding()
                                    .foregroundStyle(selectedIndex == section.rawValue ? .white : .gray)
                            })
                            
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 2)
                            .foregroundStyle(.gray)
                        
                        // Sliding indicator
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / CGFloat(TraverlFromToSection.allCases.count), height: 2)
                            .foregroundStyle(.white)
                            .offset(x: -UIScreen.main.bounds.width / 2 + (UIScreen.main.bounds.width / CGFloat(TraverlFromToSection.allCases.count)) * (CGFloat(selectedIndex) + 0.5))
                    }
                    .padding(.leading)
                    
                    
                    switch selectedIndex {
                    case 0:
                        Text("hey")
                    case 1:
                        Text("ho")
                        
                    case 2:
                        Text("hey")
                        
                    default:
                        Text("default")
                    }
                    
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    TravelFromToView()
}
