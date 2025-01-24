//
//  FavoriteStopsCellDetails.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 24..
//

import SwiftUI

struct FavoriteStopsCellDetails: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: "Kedvenc megálló hozzáadása", dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(.stops)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                HStack{
                    
                    ZStack {
                        Image(systemName: "triangle.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .offset(y: -20)
                        Circle()
                            .fill(.black)
                            .clipShape(Rectangle().offset(x: -15))
                        Circle()
                            .fill(.blue)
                            .clipShape(Rectangle().offset(x: 15))
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    }
                    .frame(height: 30)
                    .overlay {
                        Circle()
                            .fill(.black)
                            .stroke(.white, lineWidth: 2)
                            .frame(height: 20)
                    }
                    
                    
                    Text("Bogdáni út")
                        .foregroundStyle(.customBlackWhite)
                        .bold()
                        .font(.title3)
                }
                .padding()
                
                VStack{
                    HStack{
                        CustomImage(iconName: "bus", circleColor: .blue, iconColor: .white)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 70, height: 25)
                            .foregroundStyle(.blue)
                            .overlay {
                                Text("34")
                                    .bold()
                            }
                    }
                }
                
                NotificationRequestView(
                    title: "Kérsz értesítést a megállóval kapcsolatos forgalmi változásokról?"
                )
                
            }
            .padding(.top, 90)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    FavoriteStopsCellDetails()
}

struct NotificationRequestView: View {
    let title: String
    var body: some View {
        VStack{
            Text(title)
                .foregroundStyle(.customBlackWhite)
                .bold()
                .font(.title3)
            
            Spacer()
            
            VStack(spacing: 12) {
                CustomButton(title: "Kérek értesítést") {
                    print("request for notifications")
                }
                
                Button {
                     print("doesnt want notifications")
                } label: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle())
                        .overlay {
                            Text("Nem kérek értesítést")
                                .foregroundStyle(.customBlackWhite)
                                .bold()
                        }
                }
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)

            }
            .padding(.bottom)
            
        }
        .multilineTextAlignment(.center)
    }
}
