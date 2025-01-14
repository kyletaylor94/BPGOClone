//
//  InfoBox.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct InfoBox: View {
    @Binding var informationPresented: Bool
    var width: CGFloat?
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                informationPresented.toggle()
            }
        } label: {
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.white)
                .frame(width: width != nil ? width : UIScreen.main.bounds.width - 32, height: informationPresented ? 120 : 50)
                .overlay {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "lightbulb.circle.fill")
                                .foregroundStyle(.blue)
                                .font(.title2)
                            
                            Text("Információ")
                                .foregroundStyle(.blue)
                                .font(.headline)
                            
                            Spacer()
                            
                            Image(systemName: informationPresented ? "chevron.up" : "chevron.down")
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal)
                        
                        if informationPresented {
                            Text("Újdonság! Már digitálisan is elérhető a 10 db-os gyűjtőjegy egyes alkalmazásokban!")
                                .foregroundStyle(.black)
                                .padding(.horizontal)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 10)
                }
        }
    }
}

#Preview {
    InfoBox(informationPresented: .constant(false))
}
