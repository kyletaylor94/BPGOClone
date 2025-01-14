//
//  CanWeHelpCircleInfoSheet.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct CanWeHelpCircleInfoSheet: View {
    let title: String
    let subTitle: String
    let caption1: String
    let caption2: String
    let caption3: String
    let void: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                Text(title)
                    .font(.title3)
                
                Spacer()
                
                Button {
                    void()
                } label: {
                    Image(systemName: "xmark")
                }
                
            }
            .bold()
            .padding(.horizontal)
            
            
            Text(subTitle)
                .padding(.horizontal)
                .bold()
                .font(.subheadline)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack{
                    Circle()
                        .frame(height: 5)
                    
                    Text(caption1)
                    
                }
                HStack{
                    Circle()
                        .frame(height: 5)
                    
                    Text(caption2)
                    
                }
                
                HStack{
                    Circle()
                        .frame(height: 5)
                    
                    Text(caption3)
                    
                }
            }
            .padding()
        }
        .padding(.top, 30)
        .foregroundStyle(.white)
        .presentationDetents([.height(260)])
        .presentationCornerRadius(24)
        .presentationDragIndicator(.visible)
        .presentationBackground(.navBG)
    }
}

