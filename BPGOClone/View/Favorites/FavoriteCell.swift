//
//  FavoriteCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

struct FavoriteCell: View {
    let image: ImageResource
    let title: String
    let subTitle: String
    let buttonTitle: String
    
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
            
            Text(title)
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
            
            Text(subTitle)
                .foregroundStyle(.white)
                .font(.title3)
                .padding()
            
            
            Spacer()
            
            VStack{
                
                CustomButton(
                    title: buttonTitle,
                    navigateTo: viewModel.isAuthenticated ? AnyView(
                        AddNewStopView()
                    ) : AnyView(
                        RegisterSheet(
                            authVM: viewModel
                        )
                    )
                )
//                NavigationLink {
//                    if viewModel.isAuthenticated {
//                        AddNewStopView()
//                    } else {
//                        RegisterSheet(authVM: viewModel)
//                    }
//                } label: {
//                    RoundedRectangle(cornerRadius: 18)
//                        .fill(.button)
//                        .stroke(.white, style: StrokeStyle(lineWidth: 1.0))
//                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
//                        .overlay {
//                            Text(buttonTitle)
//                                .foregroundStyle(.customWhiteBlack)
//                                .font(.title3)
//                                .bold()
//                        }
//                }
            }
            .padding(.bottom, 70)
        }
        .multilineTextAlignment(.center)
    }
}

