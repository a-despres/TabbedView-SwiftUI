//
//  SwiftUI+View.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension View {
    
    /// Tab item modifier for `TabbedView` content.
    /// - Parameter item: The `BarItem` object used for constructing the tab bar icon.
    public func tabItem(_ item: TabbedItem) -> some View {
        self.preference(key: TabbedView.TabItemPreferenceKey.self, value: [
            TabbedView.TabItemPreference(tag: 0, item: item)
        ])
    }
    
    /// Content modifier for `TabbedView` content used to designate a tag value.
    /// - Parameter tag: The value of the tag.
    public func tag(_ tag: Int) -> some View {
        self.transformPreference(TabbedView.TabItemPreferenceKey.self) {
            (value: inout [TabbedView.TabItemPreference]) in
            guard value.count > 0 else { return }
            value[0].tag = tag
        }
    }
    
    func point(_ point: CGPoint, index: Int, color: Color?) -> some View {
        self.anchorPreference(key: TabbedView.TabPositionPreferenceKey.self, value: .center, transform: {
            [TabbedView.TabPositionPreference(index: index, center: $0, color: color)]
        })
    }
}
