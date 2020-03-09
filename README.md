# TabbedView-SwiftUI

A TabBar component for SwiftUI.

### Requirements

* Xcode 11
* iOS 13

### Installation

In Xcode go to `File -> Swift Packages -> Add Package Dependency` and past this repo url
`https://github.com/a-despres/TabbedView-SwiftUI`

### Example

```
TabbedView {
   Text("Child View 1")
       .tabItem(TabbedItem(icon: "1.square", title: "First"))
       .tag(0)
   Text("Child View 2")
       .tabItem(TabbedItem(icon: "2.square", title: "Second"))
       .tag(1)
   Text("Child View 3")
       .tabItem(TabbedItem(icon: "3.square", title: "Third"))
       .tag(2)
}
```
