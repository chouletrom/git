//
//  Transition+Extension.swift
//  Imagic
//
//  Created by Romain Choulet on 10/12/2020.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var slideInSlideOut: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
