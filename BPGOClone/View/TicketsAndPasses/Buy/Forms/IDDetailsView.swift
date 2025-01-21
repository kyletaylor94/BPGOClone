//
//  IDDetailsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

enum IDDetailsSection: String, Identifiable,CaseIterable {
    case residencepermit = "Magyarországi tartózkodási engedély"
    case idcard = "Személyazonosító igazolvány"
    case driverlicense = "Kártya formátumú vezetői engedély"
    case studentcard = "Diákigazolvány"
    case passport = "Útlevél"
    var id: String { return self.rawValue }
}

import SwiftUI

struct IDDetailsView: View {
    @State private var selectedSection: IDDetailsSection = .residencepermit
    @State private var isPickerPresented: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()

            CustomNavTitle(title: "Igazolványadatok", dismissAvailable: true)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Igazolvány típusa")
                        .bold()
                        .foregroundStyle(.customBlackWhite)
                    
                    Button(action: {
                        withAnimation(.snappy) {
                            isPickerPresented.toggle()
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(.navBG)
                            .overlay {
                                HStack {
                                    Text(selectedSection.rawValue)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .rotationEffect(.degrees(isPickerPresented ? 180 : 0))
                                }
                                .padding()
                                .foregroundStyle(.customBlackWhite)
                            }
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                }
                
                VStack(alignment: .leading, spacing: 25) {
                    Text("Igazolvány száma")
                        .bold()
                        .foregroundStyle(.customBlackWhite)
                        .padding(.leading)
                    
                    TextField("", text: .constant(""))
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.customWhiteBlack)
                                .stroke(.white, style: StrokeStyle())
                                .frame(width: UIScreen.main.bounds.width - 32, height: 45)
                        )
                    
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button {
                        //save
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(.button)
                            .overlay {
                                Text("Mentés")
                                    .foregroundStyle(.customWhiteBlack)
                                    .bold()
                            }
                    }
                    .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
                    
                    
                    Button {
                        //nope
                    } label: {
                        Text("Mégse")
                    }
                    .foregroundStyle(.customBlackWhite)
                    .bold()

                }
            }
            .navigationBarBackButtonHidden()
            .padding(.top, 90)
        }
        .sheet(isPresented: $isPickerPresented) {
            ZStack{
                Rectangle()
                    .foregroundStyle(.thinMaterial)
                VStack {
                    HStack{
                        Button("Kész") {
                            isPickerPresented = false
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Picker("Válassz igazolványtípust", selection: $selectedSection) {
                        ForEach(IDDetailsSection.allCases) { section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .presentationDetents([.height(200)])

        }
    }
}


#Preview {
    IDDetailsView()
}
