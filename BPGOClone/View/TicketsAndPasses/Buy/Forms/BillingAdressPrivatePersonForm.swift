//
//  BillingAdressCompanyForm.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct BillingAdressPrivatePersonForm: View {
    @Binding var isPickerPresented: Bool
    var body: some View {
        VStack(spacing: 20){
            VStack(alignment: .leading, spacing: 25) {
                Text("Számlázási név")
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
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Számlázási e-mail-cím")
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
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Ország")
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
                                Text("magyarország")
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
                Text("Irányítószám")
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
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Település")
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
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Cím")
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
            
            VStack(spacing: 20) {
                Button {
                    //save billingaddress
                } label: {
                    RoundedRectangle(cornerRadius: 14)
                        .foregroundStyle(.button)
                        .overlay {
                            Text("Cím mentése")
                                .foregroundStyle(.customWhiteBlack)
                                .bold()
                        }
                }
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                
                
                Button {
                    //megse
                } label: {
                    Text("Mégse")
                }
                .foregroundStyle(.customBlackWhite)
                .bold()

            }
            .padding(.top)
        }
        .padding(.top, 30)
    }
}

#Preview {
    BillingAdressPrivatePersonForm(isPickerPresented: .constant(false))
}
