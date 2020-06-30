//
//  TabbedView+ContentView.swift
//  TabbedView
//
//  Created by Andrew Despres on 3/6/20.
//  Copyright © 2020 Andrew Despres. All rights reserved.
//

import SwiftUI

extension TabbedView {
    
    struct ContentView: View {
        
        // MARK: - Environment
        @Binding var selection: Int
        
        // MARK: - Public Properties
        let content: [AnyView]
        
        // MARK: - Body
        var body: some View {
            
            ZStack {
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Spacer()
                        HStack(spacing: 0) {
                            Spacer()
                        }
                    }
                    .background(Color.offWhite)
                }
                .edgesIgnoringSafeArea(.all)
                
                ForEach(0 ..< content.count, id: \.self) { i in
                    Group {
                        if i == self.selection {
                            self.content[i]
                        } else {
                            self.content[i].hidden()
                        }
                    }.transition(.identity)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView.ContentView(
            selection: .constant(0),
            content: [AnyView(Text("Hello, World!"))])
    }
}
