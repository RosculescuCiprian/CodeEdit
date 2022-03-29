//
//  StatusBarIndentSelector.swift
//  
//
//  Created by Lukas Pistrol on 22.03.22.
//

import SwiftUI
import CodeFile

@available(macOS 12, *)
internal struct StatusBarIndentSelector: View {
    @ObservedObject
    private var model: StatusBarModel

    @AppStorage(EditorTabWidth.storageKey)
    private var tabWidth: Int = EditorTabWidth.default

    internal init(model: StatusBarModel) {
        self.model = model
    }

    internal var body: some View {
        Menu {
            Button {} label: {
                Text("Use Tabs")
            }.disabled(true)

            Button {} label: {
                Text("Use Spaces")
            }.disabled(true)

            Divider()

            Picker("Tab Width", selection: $tabWidth) {
                ForEach(2..<9) { index in
                    Text("\(index) Spaces")
                        .tag(index)
                }
            }
        } label: {
            Text("\(tabWidth) Spaces")
                .font(model.toolbarFont)
        }
        .menuStyle(.borderlessButton)
        .fixedSize()
        .onHover { isHovering($0) }
    }
}