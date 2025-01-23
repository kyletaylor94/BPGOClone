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
    let favoriteManagerTitle: String
    let searchTitle: String
    
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
                        FavoritesManagerView(title: favoriteManagerTitle, searchTitle: searchTitle)
                    ) : AnyView(
                        RegisterSheet(
                            authVM: viewModel
                        )
                    )
                )
            }
            .padding(.bottom, 70)
        }
        .multilineTextAlignment(.center)
    }
}

