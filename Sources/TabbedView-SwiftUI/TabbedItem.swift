//
//  TabbedItem.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

public struct TabbedItem {
    
    // MARK: - Internal Properties
    let icon: String
    let title: String
    let color: Color?
    
    // MARK: - Initialization
    public init(icon: String, title: String, color: Color? = nil) {
        self.icon = icon
        self.title = title
        self.color = color
    }
}
