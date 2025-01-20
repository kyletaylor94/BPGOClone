//
//  PassesSelector.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

enum PassesSelectorSection: Int, SelectorSection {
    case one
    case two
    
    var titleName: String{
        switch self {
        case .one:
            return "Magánszemély"
        case .two:
            return "Cég"
        }
    }
    
    var id: Int { return self.rawValue }
}
