//
//  TravelSheetView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum TravelSheetSection: Int, Identifiable, CaseIterable {
    case departures
    case routes
    case stops
    case filter
    
    var titleName: String {
        switch self {
        case .departures:
            return "Indulások"
        case .routes:
            return "Járatok"
        case .stops:
            return "Megállók"
        case .filter:
            return "Szűrő"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct TravelSheetView: View {
    @Binding var selectedIndex: Int
    @Binding var interactionIsHappened: Bool
    @Binding var sheetOffset: CGFloat
    @Binding var dragOffset: CGFloat
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, topTrailing: 24))
            
            VStack{
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 30, bottomTrailing: 0, topTrailing: 24))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                    .overlay {
                        VStack{
                            CustomTravelSelector(selectedIndex: $selectedIndex, interactionIsHappened: $interactionIsHappened)
                        }
                        .padding(.top,70)
                    }
                  //  .offset(y: max(0, sheetOffset + dragOffset)) // Minimum érték 0
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation.height // Követi a húzást
                            }
                            .onEnded { value in
                                // Logika az offset beállításához a húzás végeztével
                                let endOffset = sheetOffset + value.translation.height
                                
                                // Snap pozíciók: teljesen lent, középen, teljesen fent
                                let snapPositions: [CGFloat] = [0, 300, 623]
                                
                                // Legközelebbi snap pozíció kiválasztása
                                if let closest = snapPositions.min(by: { abs($0 - endOffset) < abs($1 - endOffset) }) {
                                    sheetOffset = closest
                                }
                                
                                dragOffset = 0 // Visszaállítás
                            }
                    )
                
                VStack{
                    switch selectedIndex {
                    case 0:
                        Text("indulások")
                            .foregroundStyle(.white)
                    case 1:
                        Text("járatok")
                            .foregroundStyle(.white)

                    case 2:
                        Text("megállók")
                            .foregroundStyle(.white)

                    case 3:
                        Text("Szűrő")
                            .foregroundStyle(.white)

                    default:
                        Text("default")
                            .foregroundStyle(.white)

                    }
                }
                
            }
            .ignoresSafeArea()
            .overlay {
                VStack{
                    Capsule()
                        .frame(width: 60, height: 5)
                        .foregroundStyle(.gray)
                    
                    Text("Németh László utca közelében")
                    Spacer()
                }
                .padding(.top)
            }
//            .toolbar {
//                ToolbarItem(placement: .navigation) {
//                    Button {
//                        //dismiss
//                    } label: {
//                        Image(systemName: "chevron.down")
//                            .foregroundStyle(.white)
//                    }
//                }
//                
//                ToolbarItem(placement: .principal) {
//                    Text("Tompa Mihály utca közelében")
//                        .font(.title3)
//                        .foregroundStyle(.white)
//                }
//            }
        }
    }
}

#Preview {
  //  NavigationStack{
    TravelSheetView(selectedIndex: .constant(0), interactionIsHappened: .constant(false), sheetOffset: .constant(620), dragOffset: .constant(0))
    //}
}
struct CustomTravelSelector: View {
    @Binding var selectedIndex: Int
    @Binding var interactionIsHappened: Bool
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                ForEach(TravelSheetSection.allCases) { section in
                    Button(action: {
                        withAnimation(.snappy) {
                            selectedIndex = section.rawValue
                            interactionIsHappened = true
                        }
                    }, label: {
                        Text(section.titleName)
                            .padding()
                            .foregroundStyle(selectedIndex == section.rawValue ? .white : .gray)
                    })
                    
                }
            }
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 2)
                    .foregroundStyle(.gray)
                
                // Sliding indicator
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / CGFloat(TravelSheetSection.allCases.count), height: 2)
                    .foregroundStyle(.white)
                    .offset(x: -UIScreen.main.bounds.width / 2 + (UIScreen.main.bounds.width / CGFloat(TravelSheetSection.allCases.count)) * (CGFloat(selectedIndex) + 0.5))
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity)
    }
}

