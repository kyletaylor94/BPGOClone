//
//  TravelFromToView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum SavePoints: String, CaseIterable, Identifiable {
    case home = "Otthon"
    case work = "Munkahely"
    case savedplaces = "Mentett helyek"
    
    var width: CGFloat {
        switch self {
        case .home:
            return 80
        case .work:
            return 110
        case .savedplaces:
            return 140
        }
    }
    
    var id: String { return self.rawValue }
}

enum TraverlFromToSection: Int, SelectorSection {
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
                                    
                                    ForEach(SavePoints.allCases) { points in
                                        Capsule()
                                            .fill(.black)
                                            .stroke(.gray, style: StrokeStyle(lineWidth: 2.0))
                                            .frame(width: points.width, height: 35)
                                            .overlay {
                                                Text(points.rawValue)
                                            }
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
                    
                    
                    TabView(selection: $selectedIndex) {
                        Text("hey")
                            .tag(0)
                        
                        Text("ho")
                            .tag(1)
                        
                        Text("heyho")
                            .tag(2)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                
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
