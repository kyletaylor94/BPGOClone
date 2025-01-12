//
//  PlanSortingView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 11..
//

import SwiftUI

struct PlanSortingView: View {
    
    var body: some View {
        ZStack{
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                .foregroundStyle(.navBG)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Térképen megjelenő pontok")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.leading)
                
                VStack(spacing: -20) {
                    ForEach(0..<4) { _ in
                        DisclosureGroup {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(0..<3) { _ in
                                    HStack{
                                        Circle()
                                            .frame(height: 20)
                                        
                                        Text("BKK megállók")
                                        
                                        Spacer()
                                        
                                        Rectangle()
                                            .frame(width: 20, height: 20)
                                    }
                                }
                            }
                            .padding()
                            
                        } label: {
                            HStack{
                                Image(systemName: "bus")
                                
                                Text("Közösségi közlekedés")
                                
                                Spacer()
                                
                            }
                            .foregroundStyle(.white)
                            .bold()
                        }
                        .padding()
                    }
                }
                
                Text("Nézetváltás")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.leading, 20)
                HStack{
                    Image(systemName: "globe")
                    
                    Text("Műhöldkép")
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    PlanSortingView()
}
