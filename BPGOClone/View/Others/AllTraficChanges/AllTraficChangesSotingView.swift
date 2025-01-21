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
                    AlltraficChangesDateChanger()
                    
                    HStack{
                        Button {
                            //sorting
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                        
                        AllTraficChangesHorizontalScrollView()
                        
                    }
                    .padding()
                }
            }
    }
}

#Preview {
    AllTraficChangesSotingView()
}
