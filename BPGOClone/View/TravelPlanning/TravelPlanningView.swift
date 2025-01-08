//
//  TravelPlanningView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI
import MapKit
import FittedSheetsSwiftUI

struct TravelPlanningView: View {
    @State private var selectedIndex: Int = 0
    @State private var interActionIshappened = false
    @State private var sheetOffset: CGFloat = 623
    @State private var dragOffset: CGFloat = 0

    var body: some View {
        ZStack {
            MapView()
            
            TravelSheetView(selectedIndex: $selectedIndex, interactionIsHappened: $interActionIshappened, sheetOffset: $sheetOffset, dragOffset: $dragOffset)
                .ignoresSafeArea()
                .offset(y: max(0, sheetOffset + dragOffset)) // Minimum érték 0
//                .gesture(
//                    DragGesture()
//                        .onChanged { value in
//                            dragOffset = value.translation.height // Követi a húzást
//                        }
//                        .onEnded { value in
//                            // Logika az offset beállításához a húzás végeztével
//                            let endOffset = sheetOffset + value.translation.height
//                            
//                            // Snap pozíciók: teljesen lent, középen, teljesen fent
//                            let snapPositions: [CGFloat] = [0, 300, 623]
//                            
//                            // Legközelebbi snap pozíció kiválasztása
//                            if let closest = snapPositions.min(by: { abs($0 - endOffset) < abs($1 - endOffset) }) {
//                                sheetOffset = closest
//                            }
//                            
//                            dragOffset = 0 // Visszaállítás
//                        }
//                )
        }
    }
}


#Preview {
    TravelPlanningView()
}
