//
//  HowAppDoesWorkView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

struct HowAppDoesWorkView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 100) {
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .foregroundStyle(.white)

                }
                .padding()
                
                Spacer()
                
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 300, height: 200)
                        .foregroundStyle(.blue)
                    
                    Text("Vedd meg az appban jegyedet vagy bérletedet!")
                        .font(.title3)
                        .bold()
                    
                    Text("Nem kell automatát vagy pénztárt keresned, a BudapestGO appban bármikor vehetsz vonaljegyet is.")
                }
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                
                
                
                VStack(spacing: 12) {
                    // circle indicator
                    
                    Button {
                        //
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)

                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    HowAppDoesWorkView()
}
