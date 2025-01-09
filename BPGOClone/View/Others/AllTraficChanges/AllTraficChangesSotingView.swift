//
//  AllTraficChangesSotingView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

enum AllTraficChangesSortingSection: String, Identifiable, CaseIterable {
    case metro = "Metró"
    case tram = "Villamos"
    case suburbantram = "HÉV"
    case bus = "Busz"
    case trolleybus = "Troli"
    case night = "Éjszakai"
    case other = "Egyéb"
    
    var id: String { return self.rawValue }
}

struct AllTraficChangesSotingView: View {
    @State private var selectedSections: [AllTraficChangesSortingSection] = []
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30))
            .foregroundStyle(.backGround)
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .overlay {
                VStack{
                    HStack{
                        Button {
                            //back in date
                        } label: {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(.navBG)
                                .stroke(.button, style: StrokeStyle(lineWidth: 0.5))
                                .frame(width: 55, height: 55)
                                .overlay {
                                    Image(systemName: "chevron.left")
                                        .foregroundStyle(.white)
                                }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("2025.01.08.")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                            
                            Text("Szerda")
                                .foregroundStyle(.white)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Button {
                            //toward in date
                        } label: {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(.navBG)
                                .stroke(.button, style: StrokeStyle(lineWidth: 0.5))
                                .frame(width: 55, height: 55)
                                .overlay {
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding()
                    
                    HStack{
                        Button {
                            //sorting
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(AllTraficChangesSortingSection.allCases) { section in
                                    Button {
                                        //
                                    } label: {
                                        Capsule()
                                            .fill(.backGround)
                                            .stroke(.gray)
                                            .frame(width: 80, height: 35)
                                            .overlay {
                                                Text(section.rawValue)
                                                    .foregroundStyle(.button)
                                                    .fontWeight(.semibold)
                                            }
                                    }

                                }
                            }
                            .padding(.leading)
                            .frame(height: 40)
                        }

                    }
                    .padding()
                }
            }
    }
}

#Preview {
    AllTraficChangesSotingView()
}
