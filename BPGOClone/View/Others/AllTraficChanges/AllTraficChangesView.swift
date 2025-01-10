//
//  AllTraficChangesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct AllTraficChangesView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(.navBG)
                    .ignoresSafeArea()
                    .frame(height: 0)
                
                
                AllTraficChangesSotingView()
                    .offset(y: -34)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading) {
                        Text("Összes")
                            .foregroundStyle(.white)
                            .bold()
        //MARK: - FIRSTCELL!
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24, topTrailing: 24))
                            .foregroundStyle(.navBG)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 330)
                            .overlay {
                                VStack(alignment: .leading, spacing: 14) {
                                    HStack{
                                        Circle()
                                            .fill(.black)
                                            .stroke(.white, style: StrokeStyle(lineWidth: 2.5))
                                            .frame(height: 20)
                                            .overlay {
                                                Text("M")
                                                    .foregroundStyle(.white)
                                                    .font(.subheadline)
                                            }
                                        Circle()
                                            .frame(height: 20)
                                            .foregroundStyle(.blue)
                                            .overlay {
                                                Text("3")
                                                    .font(.subheadline)
                                                    .bold()
                                            }
                                    }
                                    .padding(.top, 8)
                                    
                                    ForEach(0..<3) { _ in
                                        Rectangle()
                                            .foregroundStyle(.gray)
                                            .frame(width: UIScreen.main.bounds.width - 64, height: 1.0)
                                        
                                        HStack(alignment: .top,spacing: 5) {
                                            Circle()
                                                .fill(.yellow)
                                                .frame(height: 20)
                                                .overlay {
                                                    Image(systemName: "exclamationmark")
                                                        .bold()
                                                        .foregroundStyle(.black)
                                                        .font(.subheadline)
                                                }
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Újpest- Városkapu állomásnál Kőbánya-Kispest felé akadálymentesen nem érhető el")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                                    .font(.subheadline)
                                                
                                                Text("2024.december 23., hétfő 7:34-től ")
                                                    .foregroundStyle(.gray)
                                                    .font(.caption2)
                                            }
                                            
                                            Image(systemName: "chevron.right")
                                                .bold()
                                                .font(.subheadline)
                                            
                                        }
                                    }
                                }
                                .padding()
                            }
                        
        //MARK: - OtherCells
                        ForEach(0..<5) { _ in
                            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                                .frame(width: UIScreen.main.bounds.width - 32, height: 140)
                                .foregroundStyle(.navBG)
                                .overlay {
                                    VStack(alignment: .leading,spacing: 12) {
                                        HStack{
                                            Circle()
                                                .frame(height: 20)
                                                .foregroundStyle(.yellow)
                                                .overlay {
                                                    Image(systemName: "bus")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.black)
                                                }
                                            
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(width: 55, height: 22)
                                                .foregroundStyle(.yellow)
                                                .overlay {
                                                    Text("41")
                                                        .foregroundStyle(.black)
                                                        .bold()
                                                }
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .bold()
                                                .font(.subheadline)
                                        }
                                        
                                        Rectangle()
                                            .frame(width: UIScreen.main.bounds.width - 64, height: 1.0, alignment: .center)
                                            .foregroundStyle(.gray)
                                        
                                        HStack(alignment: .top,spacing: 5) {
                                            Circle()
                                                .fill(.yellow)
                                                .frame(height: 20)
                                                .overlay {
                                                    Image(systemName: "exclamationmark")
                                                        .bold()
                                                        .foregroundStyle(.black)
                                                        .font(.subheadline)
                                                }
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Újpest- Városkapu állomásnál Kőbánya-Kispest felé akadálymentesen nem érhető el")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                                    .font(.subheadline)
                                                
                                                Text("2024.december 23., hétfő 7:34-től ")
                                                    .foregroundStyle(.gray)
                                                    .font(.caption2)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                    
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Összes forgalmi változás")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack{
        AllTraficChangesView()
    }
}
