//
//  TabbedViewPreferences.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

public struct TabbedViewPreferences {
    
    // MARK: - Environment
    @Binding var foregroundColor: Color
    
    // MARK: - Internal Properties
    var backgroundColor: Color = .white
    var inactiveColor: Color = .lightGray
    var indicatorHeight: CGFloat = 6
    var shadow: Bool = false
    var titleVisibleAlways: Bool = false
    var titleVisibleOnSelection: Bool = false
    
    // MARK: - Initialization
    public init(
        backgroundColor: Color? = nil,
        foregroundColor: Binding<Color>? = nil,
        inactiveColor: Color? = nil,
        indicatorHeight: CGFloat? = nil,
        shadow: Bool? = nil,
        titleVisibleAlways: Bool? = nil,
        titleVisibleOnSelection: Bool? = nil) {
        
        if let backgroundColor = backgroundColor { self.backgroundColor = backgroundColor }
        self._foregroundColor = foregroundColor != nil ? foregroundColor! : .constant(.blue)
        if let inactiveColor = inactiveColor { self.inactiveColor = inactiveColor }
        if let indicatorHeight = indicatorHeight { self.indicatorHeight = indicatorHeight }
        if let shadow = shadow { self.shadow = shadow }
        if let titleVisibleAlways = titleVisibleAlways { self.titleVisibleAlways = titleVisibleAlways }
        if let titleVisibleOnSelection = titleVisibleOnSelection { self.titleVisibleOnSelection = titleVisibleOnSelection }
    }
    
    public init(
        backgroundColor: Color? = nil,
        foregroundColor: Color? = nil,
        inactiveColor: Color? = nil,
        indicatorHeight: CGFloat? = nil,
        shadow: Bool? = nil,
        titleVisibleAlways: Bool? = nil,
        titleVisibleOnSelection: Bool? = nil) {
        
        if let backgroundColor = backgroundColor { self.backgroundColor = backgroundColor }
        self._foregroundColor = foregroundColor != nil ? .constant(foregroundColor!) : .constant(.blue)
        if let inactiveColor = inactiveColor { self.inactiveColor = inactiveColor }
        if let indicatorHeight = indicatorHeight { self.indicatorHeight = indicatorHeight }
        if let shadow = shadow { self.shadow = shadow }
        if let titleVisibleAlways = titleVisibleAlways { self.titleVisibleAlways = titleVisibleAlways }
        if let titleVisibleOnSelection = titleVisibleOnSelection { self.titleVisibleOnSelection = titleVisibleOnSelection }
    }
    
    public init() {
        self._foregroundColor = State(initialValue: Color.blue).projectedValue
    }
}
