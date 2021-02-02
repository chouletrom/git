//
//  Font+Extension.swift
//  Trolley
//
//  Created by Romain Choulet on 24/01/2021.
//

import Foundation
import SwiftUI

extension Font {
    public static var signPainterTitle: Font {
        return Font.custom("SignPainter", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }
    
    public static var signPainter: Font {
        return Font.custom("SignPainter", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
    }
}
