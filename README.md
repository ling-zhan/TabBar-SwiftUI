# TabBar-SwiftUI
![avatar](/preview01.gif)
![avatar](/preview02.gif)

一個 TabBar 套件
  - 可自行定義 item 數量、大小、顏色
  - 可自行定義 tabbar 高度
  - 可自行定義 item 選擇時動畫
  - 支援 SF Symbols 及 自製圖片

### 版本要求
  -  Xcode 11
  -  iOS 13 以上

### 安裝
在 Xcode 中:
  - 到 **File > Add Packages...**
  - 然後貼上 github 網址：https://github.com/ling-zhan/TabBar-SwiftUI
  - 接下來按 **Add Package** 就完成了
   
 ### 如何使用
  - 匯入 TabBar-SwiftUI
  - 創建 Itam 項目
  - 創建 BottomTabBarView(...) 帶入以下參數
    - selectedIndex (使用者選擇的項目)
    - items(項目數組)
    - iconType(項目圖片的來源, 預設為 .system)
        - .system(為 SF Symbols 圖片)
        - .custom(為使用者自製的圖片)
    - iconAlignment(項目的對齊方式, 預設為 .center)
    - height(為 TabBar 的總高度, 預設為 49)

### 例子
```sh
import SwiftUI
import TabBar_SwiftUI

// 自製圖片 預設
let tabBarItems: [TabBarItem] = [
    .init(icon: "music1_gray", selectedIcon: "music1_red"),
    .init(icon: "music2_gray", selectedIcon: "music2_red"),
    .init(icon: "music3_gray", selectedIcon: "music3_red")]

// 自製圖片 指定大小與顏色
// let tabBarItems: [TabBarItem] = [
//    .init(icon: "music1_gray", selectedIcon: "music1_red",width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red),
//    .init(icon: "music2_gray", selectedIcon: "music2_red", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red),
//    .init(icon: "music3_gray", selectedIcon: "music3_red",width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red)]

// SF Symbols 預設
// let tabBarSystemItems: [TabBarItem] = [
//    .init(icon: "tag.circle", selectedIcon: "tag.circle.fill"),
//    .init(icon: "mic.circle", selectedIcon: "mic.circle.fill"),
//    .init(icon: "message.circle", selectedIcon: "message.circle.fill")]

// SF Symbols 指定大小與顏色
let tabBarSystemItems: [TabBarItem] = [
    .init(icon: "tag.circle", selectedIcon: "tag.circle.fill", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red),
    .init(icon: "mic.circle", selectedIcon: "mic.circle.fill", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red),
    .init(icon: "message.circle", selectedIcon: "message.circle.fill", width: 35, height: 35, color: .gray, selectedWidth: 38, selectedHeight: 38, selectedColor: .red)
]

struct ContentView: View {
    @State var selectedTag: Int = 0
    var body: some View {
        VStack {
            if selectedTag == 0 {
                View1()
                    .frame(minHeight: 0,maxHeight: .infinity)
                    .background(Color.yellow.edgesIgnoringSafeArea(.top))
                
            }else if selectedTag == 1 {
                View2()
                    .frame(minHeight: 0,maxHeight: .infinity)
                    .background(Color.green.edgesIgnoringSafeArea(.top))
            }else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("View3")
                        Spacer()
                    }
                    Spacer()
                }
                .frame(minHeight: 0,maxHeight: .infinity)
                .background(Color.blue.edgesIgnoringSafeArea(.top))
            }
            
            VStack(spacing: 0) {
                TabBarView(selectedIndex: $selectedTag, items: tabBarSystemItems, iconType: .system, iconAlignment: .bottom, height: 49)
                    .animation(.easeIn)
                    .background(Color.clear)
            }
                // 填充不同設備 SafeArea 底部的高度
                .background(Color.clear.edgesIgnoringSafeArea(.bottom))
        }
    }
}
```
完整範例檔 [TabBar-SwiftUI-Demo](https://github.com/ling-zhan/TabBar-SwiftUI-Demo) 

 ### 授權
MIT

