//
//  TabbedView.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

/// A view that switches between multiple child views using interactive user interface elements.
///
/// To create a user interface with tabs, place views in a `TabbedView` and apply the `tabItem(_:)` modifier to the contents of each tab. The following creates a tab view with three tabs:
///
/// ```
/// TabbedView {
///     Text("Child View 1")
///         .tabItem(TabbedItem(icon: "1.square", title: "First"))
///         .tag(0)
///     Text("Child View 2")
///         .tabItem(TabbedItem(icon: "2.square", title: "Second"))
///         .tag(1)
///     Text("Child View 3")
///         .tabItem(TabbedItem(icon: "3.square", title: "Third"))
///         .tag(2)
/// }
/// ```
///
/// Tab views are constructed from a `TabbedItem` object and consist of a single `Image` and `Text` view.
///
/// - Note: `TabbedView` supports a minimum of two child views and a maximum of four child views.

public struct TabbedView: View {
    
    // MARK: - Environment
    @State private var selection: Int
    @State private var shouldAnimate: Bool = false
    @State private var tabItems: [TabbedItem] = []
    
    // MARK: - Public Properties
    let content: [AnyView]
    
    // MARK: - Internal Properties
    var viewPreferences: TabbedViewPreferences
    
    // MARK: - Body
    public var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                ContentView(selection: $selection, content: self.content)
            }
            TabBar(selection: $selection, tabItems: $tabItems, shouldAnimate: $shouldAnimate, viewPreferences: viewPreferences)
        }
        .onPreferenceChange(TabItemPreferenceKey.self) { preferences in
            preferences.forEach { preference in
                self.tabItems.append(preference.item)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.shouldAnimate = true
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
        selection: Int? = nil,
        preferences: TabbedViewPreferences? = nil,
        @ViewBuilder content: () -> TupleView<(A, B)>) {
        
        let views = content().value
        
        self.content = [AnyView(views.0), AnyView(views.1)]
        self._selection = selection != nil ? State(initialValue: selection!) : State(initialValue: 0)
        self.viewPreferences = preferences != nil ? preferences! : TabbedViewPreferences()
    }
    
    /// Three views with tab bar.
    /// - Parameters:
    ///   - selection: The first-visible tab.
    ///   - preferences: A definition for the appearance and behavior of the tab bar.
    ///   - content: The child view to be displayed in each tab.
    public init<A: View, B: View, C: View>(
        selection: Int? = nil,
        preferences: TabbedViewPreferences? = nil,
        @ViewBuilder content: () -> TupleView<(A, B, C)>) {
        
        let views = content().value
        
        self.content = [AnyView(views.0), AnyView(views.1), AnyView(views.2)]
        self._selection = selection != nil ? State(initialValue: selection!) : State(initialValue: 0)
        self.viewPreferences = preferences != nil ? preferences! : TabbedViewPreferences()
    }
    
    /// Four views with tab bar.
    /// - Parameters:
    ///   - selection: The first-visible tab.
    ///   - preferences: A definition for the appearance and behavior of the tab bar.
    ///   - content: The child view to be displayed in each tab.
    public init<A: View, B: View, C: View, D: View>(
        selection: Int? = nil,
        preferences: TabbedViewPreferences? = nil,
        @ViewBuilder content: () -> TupleView<(A, B, C, D)>) {
        
        let views = content().value
        
        self.content = [AnyView(views.0), AnyView(views.1), AnyView(views.2), AnyView(views.3)]
        self._selection = selection != nil ? State(initialValue: selection!) : State(initialValue: 0)
        self.viewPreferences = preferences != nil ? preferences! : TabbedViewPreferences()
    }
}