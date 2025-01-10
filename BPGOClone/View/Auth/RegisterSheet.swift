//
//  RegisterSheet.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

struct RegisterSheet: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.navBG.ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Regisztrálj, vagy lépj be!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                        
                    }
                }
                .foregroundStyle(.white)
                .padding()
                
                Image(.auth1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                
                VStack(spacing: 15) {
                    Capsule()
                        .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .overlay {
                            HStack{
                                Image(systemName: "apple.logo")
                                
                                Text("Folytatás Apple-lel ")
                                    .bold()
                            }
                            .font(.title3)
                            .foregroundStyle(.white)
                        }
                    
                    Capsule()
                        .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .overlay {
                            HStack{
                                Image(systemName: "apple.logo")
                                
                                Text("Folytatás Google-lal ")
                                    .bold()
                            }
                            .font(.title3)
                            .foregroundStyle(.white)
                        }
                    
                    Capsule()
                        .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .overlay {
                            HStack{
                                Image(systemName: "apple.logo")
                                
                                Text("Folytatás Facebookkal ")
                                    .bold()
                            }
                            .font(.title3)
                            .foregroundStyle(.white)
                        }
                    
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .foregroundStyle(.button)
                        .overlay {
                            HStack{
                                Image(systemName: "envelope")
                                
                                Text("Folytatás e-mail-címmel")
                                    .bold()
                            }
                            .font(.title3)
                        
                        }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterSheet()
}
