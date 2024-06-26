//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import SwiftUI

/// Fluent specific list style enum
public enum FluentListStyle {
    case plain
    case insetGrouped
    case inset
}

/// This a wrapper around `SwiftUI.List` that has fluent style applied. It is intended to be used in conjunction with `FluentUI.FluentListSection` and `FluentUI.ListItem`
/// to provide a completely fluentized list, however, it can be used on it's own if desired.
///
/// This component is a work in progress. Expect changes to be made to it on a somewhat regular basis.
public struct FluentList<ListContent: View>: View {

    // MARK: Initializer

    /// Creates a `FluentList`
    /// - Parameters:
    ///   - content: content to show inside of the list.
    public init(@ViewBuilder content: @escaping () -> ListContent) {
        self.content = content
    }

    public var body: some View {
        @ViewBuilder
        var list: some View {
            List {
                content()
            }
        }

        @ViewBuilder
        var styledList: some View {
            switch listStyle {
            case .inset:
                list.listStyle(.inset)
            case .insetGrouped:
                list.listStyle(.insetGrouped)
            case .plain:
                list.listStyle(.plain)
            }
        }

        return styledList
    }

    /// Style to be used by the list
    var listStyle: FluentListStyle = .plain

    // MARK: Private variables

    /// Content to render inside the list
    private var content: () -> ListContent

}
