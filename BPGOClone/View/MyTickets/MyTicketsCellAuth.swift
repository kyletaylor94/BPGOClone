//
//  MyTicketsCellAuth.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 15..
//

import SwiftUI

struct MyTicketsCellAuth: View {
    let image: ImageResource
    let title: String
    let subTitle: String
    var howDoesItWork: Bool?
    
    var body: some View {
        VStack(spacing: 5) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
            
            Text(title)
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
            
            Text(subTitle)
                .foregroundStyle(.gray)
                .font(.system(size: 16))
                .padding(.horizontal)
            
            
                        
            VStack(spacing: 10) {
                
                NavigationLink {
                    TicketsAndPassesView()
                } label: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.button)
                        .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .overlay {
                            Text("Vásárlás")
                                .bold()
                                .foregroundStyle(.navBG)
                                .font(.title3)
                        }
                }
                
                if howDoesItWork != nil {
                    NavigationLink {
                        HowAppDoesWorkView()
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.navBG)
                            .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                            .overlay {
                                Text("Hogyan működik?")
                                    .bold()
                                    .foregroundStyle(.customBlackWhite)
                                    .font(.title3)
                            }
                    }
                }
            }
            .padding(.top, 50)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top)
    }
}

#Preview {
    MyTicketsCellAuth(image: .unused, title: "Jelenleg nincs felhasználható jegyed", subTitle: "Készül fel a következő utazásodra, vásárolj jegyet vagy bérletet")
}
