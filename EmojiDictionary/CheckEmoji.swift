//
//  CheckEmoji.swift
//  EmojiDictionary
//
//  Created by Bertran on 12.10.2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import Foundation

extension UnicodeScalar {
    var isEmoji: Bool {
        switch value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0xFE00...0xFE0F,   // Variation Selectors
        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        127000...127600, // Various asian characters
        65024...65039, // Variation selector
        9100...9300, // Misc items
        8400...8447: // Combining Diacritical Marks for Symbols
            return true

        default: return false
        }
    }
}
extension String {
    
    func isContainEmoji() -> Bool {
        
        return unicodeScalars.first(where: {$0.isEmoji}) != nil
    }
}
