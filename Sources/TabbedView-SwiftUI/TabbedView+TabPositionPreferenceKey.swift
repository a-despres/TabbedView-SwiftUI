//
//  TabbedView+TabPositionPreferenceKey.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension TabbedView {

    struct TabPositionPreferenceKey: PreferenceKey {
        
        static var defaultValue: [TabPositionPreference] = []
        
        static func reduce(value: inout [TabPositionPreference], nextValue: () -> [TabPositionPreference]) {
            value.append(contentsOf: nextValue())
        }
    }
}
