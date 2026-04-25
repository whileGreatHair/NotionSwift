//
//  Created by Wojciech Chojnacki on 02/06/2021.
//

import Foundation

public struct PageCreateRequest {
    public let id: Page.Identifier?
    public let parent: PageParentType // A database parent or page parent
    public let properties: [Page.PropertyName: WritePageProperty]
    public let children: [WriteBlock]?

    public init(
        id: Page.Identifier? = nil,
        parent: PageParentType,
        properties: [Page.PropertyName: WritePageProperty],
        children: [WriteBlock]? = nil
    ) {
        self.id = id
        self.parent = parent
        self.properties = properties
        self.children = children
    }
}

// MARK: - Codable

extension PageCreateRequest: Encodable {}
