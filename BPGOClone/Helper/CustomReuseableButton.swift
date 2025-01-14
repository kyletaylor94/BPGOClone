//
//  CustomReuseableButton.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 07..
//

import SwiftUI

struct CustomReuseableButton: View {
    let text: String
    let icon: String
    let topLeading: CGFloat
    let topTrailing: CGFloat
    let bottomLeading: CGFloat
    let bottomTrailing: CGFloat
    var height: CGFloat?
    var isInfoAvailable: Bool = false
    var isActiveVoid: (() -> Void)? = nil
    
    
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(topLeading: topLeading, bottomLeading: bottomLeading, bottomTrailing: bottomTrailing, topTrailing: topTrailing))
            .fill(.navBG)
            .stroke(.gray,style: StrokeStyle(lineWidth: 0.5))
            .frame(width: UIScreen.main.bounds.width - 32, height: height != nil ? height : 60)
            .overlay {
                HStack{
                    Image(systemName: icon)
                        .foregroundStyle(.white)
                        .font(.title)
                    
                    Text(text)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    if isInfoAvailable == true {
                        Button {
                            isActiveVoid?()
                        } label: {
                            Image(systemName: "info.circle")
                        }
                    }
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                .padding()
                .multilineTextAlignment(.leading)
            }
    }
}

#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        CustomReuseableButton(text: "Megjelenés", icon: "house", topLeading: 24, topTrailing: 24, bottomLeading: 0, bottomTrailing: 0)
    }
}
