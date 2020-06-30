//
//  TabbedView+TabBar.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension TabbedView {
    
    struct TabBar: View {
        
        // MARK: - Environment
        @Binding var foregroundColor: Color
        @Binding var isDisabled: Bool
        @Binding var selection: Int
        @Binding var tabItems: [TabbedItem]
        
        // MARK: - Internal Properties
        var viewPreferences: TabbedViewPreferences
        
        // MARK: - Private Properties
        private let barHeight: CGFloat = 68
        private var barWidth: CGFloat { return { UIScreen.main.bounds.width }() }
        private let tabHeight: CGFloat = 36
        private var tabWidth: CGFloat { return { UIScreen.main.bounds.width / CGFloat(tabItems.count) }() }
        
        // MARK: - Body
        var body: some View {
            
            VStack(spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0 ..< self.tabItems.count, id: \.self) { index in
                        return Button(action: {
                            withAnimation {
                                TabbedView.selectedTab.send(self.tabItems[index].title)
                                self.selection = index
                            }
                        }) {
                            TabbedItemView(
                                foregroundColor: self.$foregroundColor,
                                isDisabled: self.$isDisabled,
                                isSelected: self.selection == index,
                                item: self.tabItems[index],
                                viewPreferences: self.viewPreferences)
                                .frame(width: self.tabWidth, height: self.tabHeight)
                        }
                        .point(
                            CGPoint(x: 0, y: 0),
                            index: index,
                            color: self.tabItems[index].color)
                    }
                }
                .frame(width: self.barWidth, height: self.barHeight)
                .background(viewPreferences.backgroundColor)
//                .backgroundPreferenceValue(TabbedView.TabPositionPreferenceKey.self) { preferences in
//                    return GeometryReader { geometry in
//                        ZStack  {
//                            self.createIndicator(geometry, preferences)
//                        }
//                        .background(self.viewPreferences.backgroundColor)
//                    }
//                }
                .disabled(self.isDisabled)
                
                if UIScreen.main.nativeBounds.height > 1792 {
                    Rectangle()
                        .fill(viewPreferences.backgroundColor)
                        .frame(width: self.barWidth, height: 34)
                }
            }
        }
        
        // MARK: - Private Methods
        func createIndicator(_ geometry: GeometryProxy, _ preferences: [TabbedView.TabPositionPreference]) -> some View {
            let p = preferences.first(where: { $0.index == self.selection })

            let aCenter = p?.center
            let center = aCenter != nil ? geometry[aCenter!] : .zero

            let foregroundColor = !self.isDisabled ? (p?.color != nil ? p?.color : self.foregroundColor) : self.viewPreferences.inactiveColor
            
            var muliplier: CGFloat {
                if UIScreen.main.nativeBounds.height < 1792 { return 2 }
                return 1
            }

            return RoundedRectangle(cornerRadius: 4)
                .foregroundColor(foregroundColor)
                .frame(width: 64, height: viewPreferences.indicatorHeight * muliplier)
                .position(CGPoint(x: center.x, y: barHeight))
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView.TabBar(
            foregroundColor: .constant(.blue),
            isDisabled: .constant(false),
            selection: .constant(0),
            tabItems: .constant(previewItems),
            viewPreferences: preferences[0])
    }
}
