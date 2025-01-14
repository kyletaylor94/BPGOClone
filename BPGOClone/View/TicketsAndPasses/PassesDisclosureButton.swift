//
//  PassesDisclosureButton.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct PassesDisclosureButton<Section: TicketSection>: View {
    let topLeading: CGFloat
    let topTrailing: CGFloat
    let bottomLeading: CGFloat
    let bottomTrailing: CGFloat
    let disclosureHeight: CGFloat
    
    @Binding var disclosureIsOpen: Bool
    @Binding var sheetIsActive: Bool
    let sheetText: String
    let sheetSubtext: String
    
    let iconName: String
    let title: String
    
    var sections: [Section]
    var body: some View {
        Button {
            withAnimation {
                disclosureIsOpen.toggle()
            }
        } label: {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: topLeading, bottomLeading: bottomLeading ,bottomTrailing: bottomTrailing, topTrailing: topTrailing))
                .foregroundStyle(.navBG)
                .frame(width: UIScreen.main.bounds.width - 32, height: disclosureIsOpen ? disclosureHeight : 60)
                .overlay {
                    VStack(spacing: 5) {
                        HStack{
                            Image(systemName: iconName)
                                .foregroundStyle(.purple)
                            
                            Text(title)
                                .foregroundStyle(.white)
                                .bold()
                            
                            Button {
                                sheetIsActive.toggle()
                            } label: {
                                Image(systemName: "info.circle")
                            }
                            .sheet(isPresented: $sheetIsActive) {
                                VStack{
                                    HStack{
                                        Text(sheetText)
                                            .foregroundStyle(.black)
                                        
                                        Spacer()
                                        
                                        Button {
                                            sheetIsActive = false
                                        } label: {
                                            Image(systemName: "xmark")
                                        }
                                        .foregroundStyle(.black)
                                        
                                    }
                                    .padding()
                                    Text(sheetSubtext)
                                }
                            }
                            
                            Spacer()
                            
                            Image(systemName: disclosureIsOpen ? "chevron.up" :  "chevron.down")
                                .bold()
                                .foregroundStyle(.white)
                            
                        }
                        .padding()
                        
                        if disclosureIsOpen {
                            ForEach(sections, id : \.id) { section in
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: UIScreen.main.bounds.width - 64, height: 70)
                                    .foregroundStyle(.black)
                                    .overlay {
                                        HStack{
                                            Image(systemName: section.iconName)
                                            
                                            Text(section.id)
                                                .font(.subheadline)
                                                .multilineTextAlignment(.leading)
                                                .foregroundStyle(.customBlackWhite)
                                            
                                            Spacer()
                                            
                                            Text("\(section.priceLabel) Ft")
                                                .bold()
                                                .foregroundStyle(.white)
                                            
                                            Image(systemName: "arrow.right.circle.fill")
                                                .font(.title2)
                                                .foregroundStyle(.customBlackWhite)

                                        }
                                        .padding()
                                    }
                            }
                        }
                    }
                    .padding(.vertical)
                }
        }
    }
}
