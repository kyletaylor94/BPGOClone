//
//  CustomNavTitle.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct CustomNavTitle: View {
    var title: String?
    var dismissAvailable: Bool?
    var secondaryButtonAvailable: Bool?
    var secondaryButtonIcon: String?
    var secondaryButtonAction: AnyView?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 24))
            .fill(.navBG)
            .frame(width: UIScreen.main.bounds.width, height: 110)
            .ignoresSafeArea(edges: [.top])
            .overlay {
                VStack{
                    HStack{
                        if dismissAvailable != nil {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                
                            }
                        }
                        
                        Spacer()
                        
                        if let title {
                            Text(title)
                                .font(.title3)
                        }
                        
                        Spacer()
                        
                        if secondaryButtonAvailable != nil {
                            NavigationLink {
                                AnyView(secondaryButtonAction)

                            } label: {
                                Image(systemName: secondaryButtonIcon!)

                            }

                        }

                        
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                }
                .padding(.top, 50)
            }
    }
}

#Preview {
    CustomNavTitle()
}
