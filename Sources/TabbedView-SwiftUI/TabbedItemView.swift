//
//  TabbedItemView.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

struct TabbedItemView: View {
    
    // MARK: - Public Properties
    var isSelected: Bool
    let item: TabbedItem
    let viewPreferences: TabbedViewPreferences
    
    // MARK: - Private Properties
    var isTitleVisible: Bool {
        self.isSelected && self.viewPreferences.titleVisibleOnSelection || self.viewPreferences.titleVisibleAlways
    }
    
    // MARK: - Body
    var body: some View {

        GeometryReader { geometry in
            VStack {
                self.image
                if self.isTitleVisible {
                    self.title
                }
            }
        }
    }
    
    // MARK: - Components
    var image: some View {
        if self.item.image != nil {
            return Image(self.item.image!)
                .imageScale(.large)
                .foregroundColor(self.isSelected ? (self.item.color ?? self.viewPreferences.foregroundColor) : self.viewPreferences.inactiveColor)
        }
        
        return Image(systemName: self.item.systemImage!)
            .imageScale(.large)
            .foregroundColor(self.isSelected ? (self.item.color ?? self.viewPreferences.foregroundColor) : self.viewPreferences.inactiveColor)
    }
    
    var title: some View {
        Text(self.item.title)
            .foregroundColor(self.isSelected ? (self.item.color ?? self.viewPreferences.foregroundColor) : self.viewPreferences.inactiveColor)
            .font(.system(size: 12))
            .padding(.top, 2)
    }
}
