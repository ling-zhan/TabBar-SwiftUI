//
//  DataModel.swift
//  
//
//  Created by Ling Zhan on 2020/6/10.
//

import SwiftUI

public enum TabBarIconType {
    case system, custom
}

@available(iOS 13.0, *)
public struct TabBarItem {
    public let icon: String
    public let selectedIcon: String
    public let width: CGFloat?
    public let height: CGFloat?
    public let color: Color?
    public let selectedWidth: CGFloat?
    public let selectedHeight: CGFloat?
    public let selectedColor: Color?
    public init(
        icon: String,
        selectedIcon: String,
        width: CGFloat? = nil,
        height: CGFloat?  = nil,
        color: Color?  = nil,
        selectedWidth: CGFloat? = nil,
        selectedHeight: CGFloat? = nil,
        selectedColor: Color? = nil
    ){
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.width = width
        self.height = height
        self.color = color
        self.selectedWidth = selectedWidth
        self.selectedHeight = selectedHeight
        self.selectedColor = selectedColor
    }
}
