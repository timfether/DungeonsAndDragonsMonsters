// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MonsterQuery: GraphQLQuery {
  public static let operationName: String = "MonsterQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MonsterQuery($limit: Int!, $skip: Int) { monsters(limit: $limit, skip: $skip) { __typename index name strength dexterity constitution intelligence wisdom charisma description: desc alignment size type } }"#
    ))

  public var limit: Int
  public var skip: GraphQLNullable<Int>

  public init(
    limit: Int,
    skip: GraphQLNullable<Int>
  ) {
    self.limit = limit
    self.skip = skip
  }

  public var __variables: Variables? { [
    "limit": limit,
    "skip": skip
  ] }

  public struct Data: DnD5eAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { DnD5eAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("monsters", [Monster]?.self, arguments: [
        "limit": .variable("limit"),
        "skip": .variable("skip")
      ]),
    ] }

    public var monsters: [Monster]? { __data["monsters"] }

    /// Monster
    ///
    /// Parent Type: `Monster`
    public struct Monster: DnD5eAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { DnD5eAPI.Objects.Monster }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("index", String.self),
        .field("name", String.self),
        .field("strength", Int.self),
        .field("dexterity", Int.self),
        .field("constitution", Int.self),
        .field("intelligence", Int.self),
        .field("wisdom", Int.self),
        .field("charisma", Int.self),
        .field("desc", alias: "description", String?.self),
        .field("alignment", String.self),
        .field("size", GraphQLEnum<DnD5eAPI.Size>.self),
        .field("type", GraphQLEnum<DnD5eAPI.MonsterType>.self),
      ] }

      public var index: String { __data["index"] }
      public var name: String { __data["name"] }
      public var strength: Int { __data["strength"] }
      public var dexterity: Int { __data["dexterity"] }
      public var constitution: Int { __data["constitution"] }
      public var intelligence: Int { __data["intelligence"] }
      public var wisdom: Int { __data["wisdom"] }
      public var charisma: Int { __data["charisma"] }
      public var description: String? { __data["description"] }
      public var alignment: String { __data["alignment"] }
      public var size: GraphQLEnum<DnD5eAPI.Size> { __data["size"] }
      public var type: GraphQLEnum<DnD5eAPI.MonsterType> { __data["type"] }
    }
  }
}
