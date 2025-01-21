//
//  nearby departures.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 10..
//

import SwiftUI

struct NearbyDepartures: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 20) {
                Text("Közeli indulások")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                
                HStack{
                    Circle()
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                        .frame(height: 20)
                    Text("Megálló távolsága szerint")
                }
                .foregroundStyle(.white)
                
                HStack{
                    Circle()
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1.5))
                        .frame(height: 20)
                    Text("Indulási idő szerint")
                }
                .foregroundStyle(.white)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NearbyDepartures()
}
