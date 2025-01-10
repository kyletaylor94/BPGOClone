//
//  SettingsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var themeIsPresented = false
    @State private var languageIsPresenter = false
    @State private var nearbyDeparturesIsPresented = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 0))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
            }
            .navigationBarBackButtonHidden()
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
                    Text("Beállítások")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(spacing: 3) {
                
                Button(action: {
                    themeIsPresented.toggle()
                }, label: {
                    CustomReuseableButton(text: "Megjelenés", icon: "sun.lefthalf.filled", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0, height: 50)
                })
                .sheet(isPresented: $themeIsPresented) {
                    ThemeView()
                        .padding(.top, 50)
                        .presentationDetents([.height(400)])
                        .presentationCornerRadius(24)
                        .presentationBackground(.navBG)
                        .presentationDragIndicator(.visible)
                }
                
                Button {
                    languageIsPresenter.toggle()
                } label: {
                    CustomReuseableButton(text: "Nyelv", icon: "translate", topLeading: 0, topTrailing: 0, bottomLeading: 24, bottomTrailing: 24, height: 50)
                }
                .sheet(isPresented: $languageIsPresenter) {
                    LanguageView()
                        .presentationDetents([.height(200)])
                        .presentationCornerRadius(24)
                        .presentationBackground(.navBG)
                        .presentationDragIndicator(.visible)
                }
            }
            
            VStack{
                Button {
                    nearbyDeparturesIsPresented.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 110)
                        .overlay {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack{
                                    Text("Közeli indulások")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                    
                                    Text("Megálló távolsága szerint")
                                        .foregroundStyle(.gray)
                                        .font(.caption)
                                    
                                    Spacer()
                                }
                                
                                Text("Közeli indulások rendezése indulási idő vagy megálló távolság szerint")
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .fontWeight(.light)
                                
                            }
                            .multilineTextAlignment(.leading)
                            .padding()
                        }
                }
                .sheet(isPresented: $nearbyDeparturesIsPresented) {
                    NearbyDepartures()
                        .presentationDetents([.height(160)])
                        .presentationCornerRadius(24)
                        .presentationBackground(.navBG)
                        .presentationDragIndicator(.visible)
                }

                
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 115)
                    .overlay {
                        VStack(alignment: .leading, spacing: 5) {
                            Toggle(isOn: .constant(true)) {
                                Text("Hibabejelentés rázásra")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                            .tint(.button)
                            
                            Text("A telefon megrázása esetén előjön a hibabejelentő felület")
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                        }
                        .padding()
                    }
                
                VStack{
                    NavigationLink {
                        DocumentsView()
                    } label: {
                        CustomReuseableButton(text: "Dokumentumok", icon: "document", topLeading: 24, topTrailing: 24, bottomLeading: 24, bottomTrailing: 24, height: 53)
                    }
                    
                }
                .padding(.top)
                
                Text("Verzió: 0.0.1 ")
                    .padding(.top)
                    .foregroundStyle(.white)
            }
            .padding(.top, 140)
        }
    }
}

#Preview {
    NavigationStack{
        SettingsView()
    }
}
