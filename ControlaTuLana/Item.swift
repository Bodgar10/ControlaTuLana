//
//  Item.swift
//  ControlaTuLana
//
//  Created by Bodgar Espinosa Miranda on 06/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
