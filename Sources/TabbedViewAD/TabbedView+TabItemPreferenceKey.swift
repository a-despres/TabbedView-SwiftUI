//
//  TabbedView+TabItemPreferenceKey.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension TabbedView {
    
    struct TabItemPreferenceKey: PreferenceKey {
        
        static var defaultValue: [TabItemPreference] = []
        
        static func reduce(value: inout [TabItemPreference], nextValue: () -> [TabItemPreference]) {
            value.append(contentsOf: nextValue())
        }
    }
}
