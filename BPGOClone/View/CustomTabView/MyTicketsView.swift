//
//  MyTicketsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 05..
//

import SwiftUI

enum MyTicketsSection: Int, Identifiable, CaseIterable {
    case unused
    case used
    
    var titleName: String{
        switch self {
        case .unused:
            return "Felhasználható"
        case .used:
            return "Használt"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct MyTicketsView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()

            VStack(spacing: 0) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                    .overlay {
                        VStack(alignment: .center) {
                            HStack{
                                Spacer()
                                Text("Jegyeim")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "info.circle")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                
                VStack(spacing: 0) {
                    HStack(spacing: 112) {
                        ForEach(MyTicketsSection.allCases) { section in
                            Button(action: {
                                withAnimation(.snappy) {
                                    selectedIndex = section.rawValue
                                }
                            }, label: {
                                Text(section.titleName)
                                    .padding()
                                    .foregroundStyle(selectedIndex == section.rawValue ? .white : .gray)
                            })
                        }
                    }
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 1)
                        .foregroundStyle(.gray)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width  / CGFloat(tabItems.allCases.count ), height: 1.0)
                        .offset(x: CGFloat(selectedIndex) * UIScreen.main.bounds.width / CGFloat(tabItems.allCases.count))
                        .padding(.trailing, 215)
                        .foregroundStyle(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, -50)
                
                VStack{
                    switch selectedIndex {
                    case 0:
                        VStack(spacing: 12) {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 220, height: 220)
                                .foregroundColor(.purple)
                            
                            Text("Lépj be a fiókodba, és vásárolj egyet!")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .bold()
                            
                            Text("A jegyeket csak akkor éred el, ha belépsz a fiókodba.")
                                .foregroundStyle(.gray)
                                .font(.system(size: 16))
                                .padding()
                            
                            //navigate to how to work
                            Text("Hogyan működik a mobiljegy?")
                                .foregroundStyle(.white)
                                .bold()
                            
                            Spacer()
                            
                            VStack(spacing: 60) {
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                                    .fill(.purple)
                                    .stroke(.white, style: StrokeStyle(lineWidth: 1.0))
                                    .frame(width: UIScreen.main.bounds.width, height: 150)
                                    .overlay {
                                        HStack{
                                            Spacer()
                                            Button {
                                                //dismiss
                                            } label: {
                                                Image(systemName: "xmark")
                                            }
                                            .font(.title3)
                                            .foregroundStyle(.white)
                                        }
                                        .padding(.bottom, 70)
                                        .padding()
                                    }
                                
                                HStack{
                                    Button {
                                        //buy
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
                                        //signin
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
                                    
                                }
                            }
                            .padding(.bottom, 75)
                        }
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    case 1:
                        Text("vagy ne bánja a geci")
                    default:
                        Color.backGround.ignoresSafeArea()
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
   // ZStack {
       // Color.backGround.ignoresSafeArea()
        MyTicketsView()
   // }
}
