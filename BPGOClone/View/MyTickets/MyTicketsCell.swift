//
//  MyTicketsCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

struct MyTicketsCell: View {
    @Binding var registerIsPresented: Bool
    let image: ImageResource
    let title: String
    let subTitle: String
    let howDoesItWorkTitle: String
    let navigateTo: AnyView
    var vote: Bool?
    
    @ObservedObject var authVM: AuthViewModel
    
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
            
            NavigationLink {
                navigateTo
            } label: {
                Text(howDoesItWorkTitle)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.top)
            }
            
       
            Spacer()
            
            VStack(spacing: 60) {
                if vote != nil {
                    Link(destination: URL(string: "https://www.azevhonlapja.hu/nevezes/benyujtott-palyamu/587/budapestgo-a-digit%C3%A1lis-%C3%BAtit%C3%A1rs")!) {
                        Image(.vote)
                            .resizable()
                            .scaledToFit()
                            .overlay {
                                HStack{
                                    Spacer()
                                    
                                    Button {
                                        //dismiss
                                    } label: {
                                        Image(systemName: "xmark")
                                    }
                                    .offset(x: 2)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                }
                                .padding(.bottom, 82)
                                
                                .padding()
                            }
                    }
                }
              
                HStack{
                    NavigationLink {
                        TicketsAndPassesView()
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.button)
                            .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                            .frame(width: 200, height: 57)
                            .overlay {
                                Text("Vásárlás")
                                    .bold()
                                    .foregroundStyle(.navBG)
                                    .font(.title3)
                            }
                    }

                    
                    Button {
                        registerIsPresented = true
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.navBG)
                            .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                            .frame(width: 200, height: 57)
                            .overlay {
                                Text("Belépés")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }
                    }
                    .fullScreenCover(isPresented: $registerIsPresented) {
                        RegisterSheet(authVM: authVM)
                    }
                }
            }
            .padding(.bottom, 75)
        }
        .multilineTextAlignment(.center)
        .padding(.top)
    }
}

#Preview {
    MyTicketsCell(registerIsPresented: .constant(false), image: .unused, title: "Lépj be a fiókodba, és vásárolj jegyet!", subTitle: "A jegyeket csak akkor éred el, ha belépsz a fiókodba.", howDoesItWorkTitle: "Hogyan működik a mobiljegy?", navigateTo: AnyView(HowAppDoesWorkView()), vote: true, authVM: AuthViewModel())

}

