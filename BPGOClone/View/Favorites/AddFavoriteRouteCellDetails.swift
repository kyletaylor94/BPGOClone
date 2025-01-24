//
//  AddFavoriteRouteCellDetails.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 24..
//

import SwiftUI

struct AddFavoriteRouteCellDetails: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            CustomNavTitle(title: "Kedvenc járat hozzáadása", dismissAvailable: true)
                .ignoresSafeArea()
            
          
            
            ScrollView{
                VStack{
                    AddFavoriteRouteBackground()
                        .frame(height: 300)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.navBG)
                        .frame(width: UIScreen.main.bounds.width, height: 600)
                        .overlay {
                            VStack{
                                HStack{
                                    Circle()
                                        .foregroundStyle(.button)
                                        .frame(height: 25)
                                        .overlay {
                                            Text("9")
                                                .bold()
                                            
                                        }
                                    
                                    Image(systemName: "triangle.fill")
                                        .rotationEffect(.degrees(90))
                                        .foregroundStyle(.gray)
                                    
                                    Text("Csömör")
                                    
                                    Spacer()
                                    
                                    Button {
                                        //sorting < or >
                                    } label: {
                                        RoundedRectangle(cornerRadius: 14)
                                            .fill(.backGround)
                                            .stroke(.gray, style: StrokeStyle())
                                            .frame(width: 40, height: 40)
                                            .overlay {
                                                Image(systemName: "house")
                                                    .foregroundStyle(.customBlackWhite)
                                            }
                                    }
                                    
                                }
                                .padding()
                                
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width  - 32 ,height: 1)
                                    .foregroundStyle(.gray)
                                
                                VStack(spacing: 0){
                                    HStack{
                                        VStack(alignment: .leading, spacing: 0) {
                                            ForEach(0..<5) { _ in
                                                
                                                HStack{
                                                    Circle()
                                                        .foregroundStyle(.button)
                                                        .frame(height: 20)
                                                        .overlay {
                                                            Image(systemName: "checkmark")
                                                                .font(.caption)
                                                                .foregroundStyle(.customBlackWhite)
                                                                .bold()
                                                        }
                                                    Text("Örs vezér tere")
                                                }
                                                
                                                Rectangle()
                                                    .frame(width: 2, height: 35, alignment: .center)
                                                    .padding(.leading, 8)
                                                
                                            }
                                            
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                }
                            }
                        }
                }
            }
            .padding(.top, 70)
          

        }
        .safeAreaInset(edge: .bottom) {
            CustomButton(
                title: "Teljes vonal érdekel",
                navigateTo: AnyView(
                    AddFaroriteRouteCellDetailsNotification()
                )
            )
            .padding(.bottom)
        }
    }
}

struct AddFaroriteRouteCellDetailsNotification: View {
    var body: some View {
        ZStack(alignment: .top) {
            CustomNavTitle(title: "Kedvenc járat hozzáadása", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 20) {
                    HStack(spacing: 0) {
                        CustomImage(iconName: "bus", circleColor: .white, iconColor: .white)
                        Circle()
                            .frame(height: 30)
                            .overlay {
                                Text("9")
                                    .bold()
                            }
                    }
                    
                    HStack{
                        Text("Örs vezér tere")
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(90))
                        
                        Text("Csömör")
                    }
                }
                
                NotificationRequestView(
                    title: "Kérsz értesítést a járattal kapcsolatos forgalmi változásokról?"
                )
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NavigationStack{
        AddFavoriteRouteCellDetails()
    }
}
