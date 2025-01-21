//
//  BuyView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct BuyView: View {
    @State private var selectedDate = Date.now
    @State private var calendSheetIsActive: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Vásárlás")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 24)
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 32, height: 160)
                    .overlay {
                        VStack(alignment: .leading) {
                            HStack{
                                Circle()
                                    .frame(height: 20)
                                Rectangle()
                                    .frame(width: 70, height: 25)
                                
                                Spacer()
                                
                                NavigationLink {
                                    EmptyView()
                                    //details
                                } label: {
                                    Image(systemName: "info.circle")
                                        .font(.title2)
                                        .foregroundStyle(.blue)
                                }
                            }
                            .padding()
                            
                            HStack(spacing: 20) {
                                Text("Félhavi (15\nnapos)\nBudapest -Bérlet")
                                    .font(.title2)
                                    .bold()
                                    .padding(.leading)
                                
                                VStack{
                                    Rectangle()
                                        .foregroundStyle(.gray)
                                        .frame(width: 2, height: 90)
                                }
                                
                                Spacer()
                                
                                Text("5950 Ft")
                                    .bold()
                                    .padding(.top, 50)
                                    .padding(.trailing)
                            }
                        }
                    }
                
                VStack(spacing: 20) {
                    Text("Legkorábban a vásárlás után 2 perccel használható utazásra")
                        .font(.caption)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 2)
                        .foregroundStyle(.gray)
                }
                
                VStack{
                    
                    Button {
                        calendSheetIsActive.toggle()

                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.navBG)
                            .stroke(.gray, style: StrokeStyle())
                            .frame(width: UIScreen.main.bounds.width - 32, height: 70)
                            .overlay {
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "calendar")
                                        .font(.title2)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Érvényesség kezdete")
                                            .font(.caption)
                                        Text("2025.01.20. (ma)")
                                            .bold()
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.top, 10)
                                }
                                .padding()
                            }
                    }
                    .foregroundStyle(.primary)
                    .sheet(isPresented: $calendSheetIsActive) {
                        ZStack{
                            Color.navBG.ignoresSafeArea()
                            
                            VStack{
                                HStack{
                                    Text("Dátum")
                                        .bold()
                                        .foregroundStyle(.customBlackWhite)
                                    
                                    Spacer()
                                    
                                    Button {
                                        calendSheetIsActive = false
                                    } label: {
                                        Image(systemName: "xmark")
                                            .bold()
                                            .foregroundStyle(.customBlackWhite)
                                    }

                                }
                                .padding()
                                
                                DatePicker("", selection: $selectedDate)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .frame(maxHeight: 400)
                            }
                        }
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(20)
                    }

                 
                    
                    NavigationLink(destination: {
                        IDDetailsView()
                    }, label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.navBG)
                            .stroke(.gray, style: StrokeStyle())
                            .frame(width: UIScreen.main.bounds.width - 32, height: 100)
                            .overlay {
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "person.text.rectangle")
                                        .font(.title2)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Igazolványszám")
                                            .font(.caption)
                                        Text("Kérjük, add meg az\nigazolványszámod")
                                            .foregroundStyle(.red)
                                            .bold()
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.top, 22)
                                }
                                .padding()
                            }
                    })
                    .foregroundStyle(.primary)
                }
                
                VStack(spacing: 40) {
                    RoundedRectangle(cornerRadius: 24)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 70)
                        .foregroundStyle(.navBG)
                        .overlay {
                            HStack(spacing: 12){
                                Image(systemName: "bell")
                                    .font(.title2)
                                
                                Text("Értesítés a \nlejárat előtt")
                                    .bold()
                                
                                Button {
                                    //info
                                } label: {
                                    Image(systemName: "info.circle")
                                }

                                Toggle(isOn: .constant(true)) {
                                }
                            }
                            .padding(.horizontal)
                        }
                    
                    NavigationLink(destination: {
                        BuySecondaryView()
                    }, label: {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.button)
                            .overlay {
                                Text("Tovább")
                                    .bold()
                                    .foregroundStyle(.customWhiteBlack)
                            }
                    })
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)

                }
                    
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    BuyView()
}
