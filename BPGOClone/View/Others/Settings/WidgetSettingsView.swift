//
//  WidgetSettingsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 19..
//

import SwiftUI

struct WidgetSettingsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Widget", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack{
                Text("Nem rendelkezzel jeggyel vagy bérlettel")
                Text("A widget előnya,hogy jegyweidet vagy bérletedet elérheted a telefonod főképernyőjáről.")
                
                Text("A widget hastnálatához vásárolj az applikáción keresztül jegyet vag bérletet, és vedd fel a főképernyőre a BKK- widgetet.")
                Spacer()
                
                VStack{
                    Button {
                        //
                    } label: {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.button)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 45)
                            .overlay {
                                Text("Jegyvásárlás")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.customWhiteBlack)
                            }
                    }

                }
            }
            .navigationBarBackButtonHidden()
            .multilineTextAlignment(.center)
            .padding(.top, 90)
        }
    }
}

#Preview {
    WidgetSettingsView()
}
