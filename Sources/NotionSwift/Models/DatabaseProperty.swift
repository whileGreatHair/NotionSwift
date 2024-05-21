//
//  Created by Wojciech Chojnacki on 29/05/2021.
//

import Foundation

public struct DatabaseProperty {
    public typealias Identifier = EntityIdentifier<DatabaseProperty, String>
    public let id: Identifier
    public let name: String
    public let type: DatabasePropertyType

    public init(
        id: DatabaseProperty.Identifier,
        name: String,
        type: DatabasePropertyType
    ) {
        self.id = id
        self.name = name
        self.type = type
    }
}

extension DatabaseProperty: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Identifier.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try DatabasePropertyType(from: decoder)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        
        try self.type.encode(to: encoder)
    }
}

extension DatabaseProperty: Equatable {
    public static func == (lhs: DatabaseProperty, rhs: DatabaseProperty) -> Bool {
        lhs.id == rhs.id
    }
}

extension DatabaseProperty: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
