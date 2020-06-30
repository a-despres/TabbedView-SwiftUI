//
//  TabbedItemView.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

struct TabbedItemView: View {
    
    // MARK: - Environment
    @Binding var foregroundColor: Color
    @Binding var isDisabled: Bool
    
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

        VStack {
            self.image
            if self.isTitleVisible {
                self.title
            }
        }
//        GeometryReader { geometry in
//            VStack(alignment: .center) {
//                self.image
//                if self.isTitleVisible {
//                    self.title
//                }
//            }
//        }
    }
    
    // MARK: - Components
    var image: some View {
        if self.item.image != nil {
            return Image(self.item.image!)
                .imageScale(.large)
                .foregroundColor(self.isSelected ? (!self.isDisabled ? (self.item.color ?? self.foregroundColor) : self.viewPreferences.inactiveColor) : self.viewPreferences.inactiveColor)
        }
        
        return Image(systemName: self.item.systemImage!)
            .imageScale(.large)
            .foregroundColor(self.isSelected ? (!self.isDisabled ? (self.item.color ?? self.foregroundColor) : self.viewPreferences.inactiveColor) : self.viewPreferences.inactiveColor)
    }
    
    var title: some View {
        Text(self.item.title)
            .foregroundColor(self.isSelected ? (!self.isDisabled ? (self.item.color ?? self.foregroundColor) : self.viewPreferences.inactiveColor) : self.viewPreferences.inactiveColor)
            .font(.system(size: 12))
            .padding(.top, 2)
    }
}

struct TabbedItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack {
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[0], viewPreferences: preferences[0])
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[1], viewPreferences: preferences[1])
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[2], viewPreferences: preferences[2])
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[3], viewPreferences: preferences[3])
            }
            
            HStack {
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[0], viewPreferences: preferences[0])
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[1], viewPreferences: preferences[1])
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[2], viewPreferences: preferences[2])
                TabbedItemView(foregroundColor: .constant(.black), isDisabled: .constant(false), isSelected: false, item: previewItems[3], viewPreferences: preferences[3])
            }
            .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 400, height: 48))
    }
}
