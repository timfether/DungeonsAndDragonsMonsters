// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MonsterQuery: GraphQLQuery {
  public static let operationName: String = "MonsterQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MonsterQuery($limit: Int!, $skip: Int) { monsters(limit: $limit, skip: $skip) { __typename id: index name imagePath: image strengthScore: strength dexterityScore: dexterity constitutionScore: constitution intelligenceScore: intelligence wisdomScore: wisdom charismaScore: charisma description: desc alignment size type } }"#
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
        .field("index", alias: "id", String.self),
        .field("name", String.self),
        .field("image", alias: "imagePath", String?.self),
        .field("strength", alias: "strengthScore", Int.self),
        .field("dexterity", alias: "dexterityScore", Int.self),
        .field("constitution", alias: "constitutionScore", Int.self),
        .field("intelligence", alias: "intelligenceScore", Int.self),
        .field("wisdom", alias: "wisdomScore", Int.self),
        .field("charisma", alias: "charismaScore", Int.self),
        .field("desc", alias: "description", String?.self),
        .field("alignment", String.self),
        .field("size", GraphQLEnum<DnD5eAPI.Size>.self),
        .field("type", GraphQLEnum<DnD5eAPI.MonsterType>.self),
      ] }

      public var id: String { __data["id"] }
      public var name: String { __data["name"] }
      public var imagePath: String? { __data["imagePath"] }
      public var strengthScore: Int { __data["strengthScore"] }
      public var dexterityScore: Int { __data["dexterityScore"] }
      public var constitutionScore: Int { __data["constitutionScore"] }
      public var intelligenceScore: Int { __data["intelligenceScore"] }
      public var wisdomScore: Int { __data["wisdomScore"] }
      public var charismaScore: Int { __data["charismaScore"] }
      public var description: String? { __data["description"] }
      public var alignment: String { __data["alignment"] }
      public var size: GraphQLEnum<DnD5eAPI.Size> { __data["size"] }
      public var type: GraphQLEnum<DnD5eAPI.MonsterType> { __data["type"] }
    }
  }
}
