//
//  AlltraficChangesDateChanger.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct AlltraficChangesDateChanger: View {
    var body: some View {
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
    }
}

#Preview {
    AlltraficChangesDateChanger()
}
