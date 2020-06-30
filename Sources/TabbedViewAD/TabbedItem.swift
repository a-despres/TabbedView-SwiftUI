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
    let image: String?
    let systemImage: String?
    let title: String
    let color: Color?
    
    // MARK: - Initialization
    public init(image: String, title: String, color: Color? = nil) {
        self.image = image
        self.systemImage = nil
        self.title = title
        self.color = color
    }
    
    public init(systemImage: String, title: String, color: Color? = nil) {
        self.image = nil
        self.systemImage = systemImage
        self.title = title
        self.color = color
    }
}
