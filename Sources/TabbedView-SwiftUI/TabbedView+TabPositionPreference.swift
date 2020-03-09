//
//  TabbedView+TabPositionPreference.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension TabbedView {
    
    struct TabPositionPreference: Equatable {
        
        var index: Int
        var center: Anchor<CGPoint>?
        var color: Color?

        static func == (lhs: TabPositionPreference, rhs: TabPositionPreference) -> Bool {
            return lhs.index == rhs.index
        }
    }
}
