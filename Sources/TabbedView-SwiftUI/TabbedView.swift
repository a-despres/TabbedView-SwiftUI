//
//  TabbedView.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI
import Combine

/// A view that switches between multiple child views using interactive user interface elements.
///
/// To create a user interface with tabs, place views in a `TabbedView` and apply the `tabItem(_:)` modifier to the contents of each tab. The following creates a tab view with three tabs:
///
/// ```
/// TabbedView {
///     Text("Child View 1")
///         .tabItem(TabbedItem(systemImage: "1.square", title: "First"))
///         .tag(0)
///     Text("Child View 2")
///         .tabItem(TabbedItem(systemImage: "2.square", title: "Second"))
///         .tag(1)
///     Text("Child View 3")
///         .tabItem(TabbedItem(systemImage: "3.square", title: "Third"))
///         .tag(2)
/// }
/// ```
///
/// Tab views are constructed from a `TabbedItem` object and consist of a single `Image` and `Text` view.
///
/// - Note: `TabbedView` supports a minimum of two child views and a maximum of four child views.

public struct TabbedView: View {
    
    // MARK: - Environment
    @Binding private var isDisabled: Bool
    @Binding private var selection: Int
    @State private var tabItems: [TabbedItem] = []
    
    // MARK: - Public Properties
    let content: [AnyView]
    
    // MARK: - Internal Properties
    var viewPreferences: TabbedViewPreferences
    
    // MARK: - Static Passthrough Subject
    public static var selectedTab = PassthroughSubject<String, Never>()
    
    // MARK: - Body
    public var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                ContentView(selection: $selection, content: self.content)
            }
            TabBar(foregroundColor: viewPreferences.$foregroundColor, isDisabled: $isDisabled, selection: $selection, tabItems: $tabItems, viewPreferences: viewPreferences)
                .shadow(color: Color.black.opacity(viewPreferences.shadow ? 0.1 : 0.0), radius: 16, x: 0, y: -4)
        }
        .onPreferenceChange(TabItemPreferenceKey.self) { preferences in
            preferences.forEach { preference in
                self.tabItems.append(preference.item)
            }
        }
    }
    
    // MARK: - Initialization
        
    /// Two views with tab bar.
    /// - Parameters:
    ///   - selection: The first-visible tab.
    ///   - preferences: A definition for the appearance and behavior of the tab bar.
    ///   - content: The child view to be displayed in each tab.
    public init<A: View, B: View>(
        selection: Binding<Int>? = nil,
        disabled: Binding<Bool>? = nil,
        preferences: TabbedViewPreferences? = nil,
        @ViewBuilder content: () -> TupleView<(A, B)>) {
        
        let views = content().value
        
        self.content = [AnyView(views.0), AnyView(views.1)]
        self._selection = selection != nil ? selection! : State(initialValue: 0).projectedValue
        self._isDisabled = disabled != nil ? disabled!: State(initialValue: false).projectedValue
        self.viewPreferences = preferences != nil ? preferences! : TabbedViewPreferences()
    }
    
    /// Three views with tab bar.
    /// - Parameters:
    ///   - selection: The first-visible tab.
    ///   - preferences: A definition for the appearance and behavior of the tab bar.
    ///   - content: The child view to be displayed in each tab.
    public init<A: View, B: View, C: View>(
        selection: Binding<Int>? = nil,
        disabled: Binding<Bool>? = nil,
        preferences: TabbedViewPreferences? = nil,
        @ViewBuilder content: () -> TupleView<(A, B, C)>) {
        
        let views = content().value
        
        self.content = [AnyView(views.0), AnyView(views.1), AnyView(views.2)]
        self._selection = selection != nil ? selection! : State(initialValue: 0).projectedValue
        self._isDisabled = disabled != nil ? disabled!: State(initialValue: false).projectedValue
        self.viewPreferences = preferences != nil ? preferences! : TabbedViewPreferences()
    }
    
    /// Four views with tab bar.
    /// - Parameters:
    ///   - selection: The first-visible tab.
    ///   - preferences: A definition for the appearance and behavior of the tab bar.
    ///   - content: The child view to be displayed in each tab.
    public init<A: View, B: View, C: View, D: View>(
        selection: Binding<Int>? = nil,
        disabled: Binding<Bool>? = nil,
        preferences: TabbedViewPreferences? = nil,
        @ViewBuilder content: () -> TupleView<(A, B, C, D)>) {
        
        let views = content().value
        
        self.content = [AnyView(views.0), AnyView(views.1), AnyView(views.2), AnyView(views.3)]
        self._selection = selection != nil ? selection! : State(initialValue: 0).projectedValue
        self._isDisabled = disabled != nil ? disabled!: State(initialValue: false).projectedValue
        self.viewPreferences = preferences != nil ? preferences! : TabbedViewPreferences()
    }
}
