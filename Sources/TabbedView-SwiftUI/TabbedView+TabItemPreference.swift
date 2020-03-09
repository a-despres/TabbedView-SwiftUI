//
//  TabbedView+TabItemPreference.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension TabbedView {
    
    struct TabItemPreference: Equatable {

        var tag: Int
        var item: TabbedItem

        static func == (lhs: TabItemPreference, rhs: TabItemPreference) -> Bool {
            return lhs.tag == rhs.tag
        }
    }
}
