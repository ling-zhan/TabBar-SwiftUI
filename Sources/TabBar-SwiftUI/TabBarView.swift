//
//  TabBarView.swift
//
//
//  Created by Ling Zhan on 2020/6/10.
//

import SwiftUI

@available(iOS 13.0, *)
public struct TabBarItemView: View {
    @Binding var selectedTag: Int
    let tag: Int
    let iconType: TabBarIconType
    let item: TabBarItem
    public var body: some View {
        VStack {
            if selectedTag == tag {
                if iconType == .system {
                    Image(systemName: item.selectedIcon)
                        .resizable()
                        .modifier(ImageStyleModifier(width: item.selectedWidth, height: item.selectedHeight, color: item.selectedColor))
                }else {
                    Image(item.selectedIcon)
                }
            } else {
                if iconType == .system {
                    Image(systemName: item.icon)
                        .resizable()
                        .modifier(ImageStyleModifier(width: item.width, height: item.height, color: item.color))
                }else {
                    Image(item.icon)
                }
            }
        }
    }
    private struct ImageStyleModifier: ViewModifier {
        let width, height: CGFloat?
        let color: Color?
        func body(content: Content) -> some View {
            return content
                .frame(width: width, height: height, alignment: .center)
                .foregroundColor(color)
        }
    }
}

@available(iOS 13.0, *)
public struct TabBarView: View {
    @Binding public var selectedIndex: Int
    public let items: [TabBarItem]
    public var iconType: TabBarIconType
    public let iconAlignment: Alignment
    public var height: CGFloat
    public init(selectedIndex: Binding<Int>,
                items: [TabBarItem],
                iconType: TabBarIconType = .system,
                iconAlignment: Alignment = .center,
                height: CGFloat = 49
    ) {
        self._selectedIndex = selectedIndex
        self.items = items
        self.iconType = iconType
        self.iconAlignment = iconAlignment
        self.height = height
    }
    public var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(0..<self.items.count) { index in
                    TabBarItemView(selectedTag: self.$selectedIndex,
                                   tag: index,
                                   iconType: self.iconType,
                                   item: self.items[index])
                        .onTapGesture(perform: {
                            self.selectedIndex = index
                        })
                        .frame(
                            width: geometry.size.width / CGFloat(self.items.count),
                            height: self.height, alignment: self.iconAlignment)
                }
            }
        }.frame(height: self.height)
    }
}
