//
//  PreviewData.swift
//  
//
//  Created by Andrew on 6/30/20.
//

import Foundation

fileprivate let previewItem1 = TabbedItem(
    systemImage: "1.circle",
    title: "Item 1",
    color: .red)

fileprivate let previewItem2 = TabbedItem(
    systemImage: "2.circle",
    title: "Item 2",
    color: .orange)

fileprivate let previewItem3 = TabbedItem(
    systemImage: "3.circle",
    title: "Item 3",
    color: .green)

fileprivate let previewItem4 = TabbedItem(
    systemImage: "4.circle",
    title: "Item 4",
    color: .blue)

let previewItems = [
    previewItem1,
    previewItem2,
    previewItem3,
    previewItem4]

fileprivate let preferences1 = TabbedViewPreferences(
    backgroundColor: .white,
    foregroundColor: .constant(.red),
    inactiveColor: .blue,
    indicatorHeight: 8,
    shadow: false,
    titleVisibleAlways: false,
    titleVisibleOnSelection: false)

fileprivate let preferences2 = TabbedViewPreferences(
    backgroundColor: .white,
    foregroundColor: .constant(.orange),
    inactiveColor: .blue,
    indicatorHeight: 8,
    shadow: false,
    titleVisibleAlways: true,
    titleVisibleOnSelection: false)

fileprivate let preferences3 = TabbedViewPreferences(
    backgroundColor: .white,
    foregroundColor: .constant(.green),
    inactiveColor: .blue,
    indicatorHeight: 8,
    shadow: false,
    titleVisibleAlways: false,
    titleVisibleOnSelection: true)

fileprivate let preferences4 = TabbedViewPreferences(
    backgroundColor: .white,
    foregroundColor: .constant(.blue),
    inactiveColor: .blue,
    indicatorHeight: 8,
    shadow: false,
    titleVisibleAlways: false,
    titleVisibleOnSelection: false)

let preferences = [
    preferences1,
    preferences2,
    preferences3,
    preferences4]
