//
//  AddFavoriteRouteBackground.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 24..
//

import SwiftUI

struct AddFavoriteRouteBackground: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack{
                HStack(spacing: 0) {
                    Circle()
                        .fill(.black)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                        .frame(height: 25)
                    
                    Rectangle()
                        .frame(width: 60, height: 1)
                        .foregroundStyle(.pink)
                    
                    
                    Circle()
                        .frame(height: 30)
                        .foregroundStyle(.pink.opacity(0.6))
                        .overlay {
                            Image(systemName: "checkmark")
                                .font(.caption)
                                .bold()
                        }
                    
                    Rectangle()
                        .foregroundStyle(.pink)
                        .frame(width: 60, height: 1)
                    
                    Circle()
                        .frame(height: 30)
                        .foregroundStyle(.pink.opacity(0.6))
                        .overlay {
                            Image(systemName: "checkmark")
                                .font(.caption)
                                .bold()
                        }
                    
                    
                    Rectangle()
                        .foregroundStyle(.pink)
                        .frame(width: 60, height: 1)
                    
                    Circle()
                        .frame(height: 30)
                        .foregroundStyle(.pink.opacity(0.6))
                        .overlay {
                            Image(systemName: "checkmark")
                                .font(.caption)
                                .bold()
                        }
                    
                    
                    Rectangle()
                        .foregroundStyle(.pink)
                        .frame(width: 60, height: 1)
                    
                    Circle()
                        .fill(.black)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                        .frame(height: 25)
                    
                    Rectangle()
                        .foregroundStyle(.pink)
                        .frame(width: 15, height: 1)
                }
                
                Image(systemName: "hand.rays.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.button, .white)
                    .font(.system(size: 50))
                    .offset(x: 100,y: -25)
                    .rotationEffect(.degrees(-15))
                
                Text("Jelöld ki a kétvégpontját annak a szakasznak, amelyiket el szeretnéd menteni.")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.title3)
            }
        }
    }
}


#Preview {
    AddFavoriteRouteBackground()
}
