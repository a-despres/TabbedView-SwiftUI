//
//  TabbedViewPreferences.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

public struct TabbedViewPreferences {
    
    // MARK: - Internal Properties
    var backgroundColor: Color = .white
    var foregroundColor: Color = .blue
    var inactiveColor: Color = .lightGray
    
    var indicatorHeight: CGFloat = 6
    
    var titleVisibleAlways: Bool = false
    var titleVisibleOnSelection: Bool = false
    
    // MARK: - Initialization
    public init(
        backgroundColor: Color? = nil,
        foregroundColor: Color? = nil,
        inactiveColor: Color? = nil,
        indicatorHeight: CGFloat? = nil,
        titleVisibleAlways: Bool? = nil,
        titleVisibleOnSelection: Bool? = nil) {
        
        if let backgroundColor = backgroundColor { self.backgroundColor = backgroundColor }
        if let foregroundColor = foregroundColor { self.foregroundColor = foregroundColor }
        if let inactiveColor = inactiveColor { self.inactiveColor = inactiveColor }
        if let indicatorHeight = indicatorHeight { self.indicatorHeight = indicatorHeight }
        if let titleVisibleAlways = titleVisibleAlways { self.titleVisibleAlways = titleVisibleAlways }
        if let titleVisibleOnSelection = titleVisibleOnSelection { self.titleVisibleOnSelection = titleVisibleOnSelection }
    }
}
