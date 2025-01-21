//
//  BuySecondaryView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 20..
//

import SwiftUI

struct BuySecondaryView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Vásárlás", dismissAvailable: true)
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
                .padding(.top)
                
                VStack(spacing: 5) {
                    NavigationLink {
                        BillingAdressView()
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.navBG)
                            .stroke(.gray, style: StrokeStyle())
                            .frame(width: UIScreen.main.bounds.width - 32, height: 100)
                            .overlay {
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "document")
                                        .font(.title2)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Számlázási adatok")
                                            .font(.caption)
                                        Text("Add meg a számlázási adataid\na fizetéshez")
                                            .bold()
                                            .foregroundStyle(.red)
                                            .multilineTextAlignment(.leading)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.top, 10)
                                }
                            
                                .padding()
                            }
                    }
                    .foregroundStyle(.primary)

                    
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle())
                        .frame(width: UIScreen.main.bounds.width - 32, height: 100)
                        .overlay {
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "document")
                                    .font(.title2)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Fizetés")
                                        .font(.caption)
                                    Text("Bankkártyás fizetés")
                                        .bold()
                                    
                                    HStack{
                                        RoundedRectangle(cornerRadius: 6)
                                            .fill(.navBG)
                                            .stroke(.white, style: StrokeStyle(lineWidth: 2))
                                            .frame(width: 20, height: 20)
                                            .overlay {
                                                Image(systemName: "checkmark")
                                                    .bold()
                                                    .font(.caption)
                                            }
                                    }
                                }
                                
                                Spacer()
                                
                            }
                            .padding()
                        }
                }
                
                VStack{
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle())
                        .frame(width: UIScreen.main.bounds.width - 32, height: 100)
                        .overlay {
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "document")
                                    .font(.title2)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    HStack{
                                        Text("Automatikus\nújravásárlás")
                                            .bold()
                                        
                                        Button {
                                            //info
                                        } label: {
                                            Image(systemName: "info.circle")
                                        }

                                    }
                                    HStack{
                                        Circle()
                                            .frame(height: 18)
                                            .overlay {
                                                Image(systemName: "xmark")
                                                    .font(.caption)
                                                    .foregroundStyle(.customWhiteBlack)
                                            }
                                        Text("Kikapcsolva")
                                            .font(.caption)
                                            .bold()
                                    }
                                }
                                
                                Spacer()
                                
                                Button {
                                    //toggle
                                } label: {
                                    Text("Bekapcsolás")
                                        .bold()
                                        .foregroundStyle(.customBlackWhite)
                                }
                                .padding(.top, 22)

                            }
                            .padding()
                        }

                }
                
                
                Spacer()

                VStack{
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white, style: StrokeStyle(lineWidth: 0.7))
                        .fill(.customWhiteBlack)
                        .frame(width: UIScreen.main.bounds.width - 2, height: 110)
                        .offset(y: 30)
                        .overlay {
                            HStack{
                                VStack(alignment: .center) {
                                    Text("Összesen")
                                        .font(.subheadline)
                                    
                                    Text("945 Ft")
                                        .font(.title2)
                                        .bold()
                                        .foregroundStyle(.customBlackWhite)
                                }
                                
                                Spacer()
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 190, height: 50)
                                    .foregroundStyle(.button)
                                    .overlay {
                                        Text("Fizetés")
                                            .bold()
                                            .font(.title3)
                                            .foregroundStyle(.customWhiteBlack)
                                    }
                            }
                            .padding(.top, 50)
                            .padding(.horizontal, 30)
                            
                        }
                }
                
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    BuySecondaryView()
}
