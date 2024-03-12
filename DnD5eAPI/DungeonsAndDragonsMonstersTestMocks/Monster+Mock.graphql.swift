// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import DnD5eAPI

public class Monster: MockObject {
  public static let objectType: ApolloAPI.Object = DnD5eAPI.Objects.Monster
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Monster>>

  public struct MockFields {
    @Field<String>("alignment") public var alignment
    @Field<Int>("charismaScore") public var charismaScore
    @Field<Int>("constitutionScore") public var constitutionScore
    @Field<String>("description") public var description
    @Field<Int>("dexterityScore") public var dexterityScore
    @Field<String>("id") public var id
    @Field<String>("imagePath") public var imagePath
    @Field<Int>("intelligenceScore") public var intelligenceScore
    @Field<String>("name") public var name
    @Field<GraphQLEnum<DnD5eAPI.Size>>("size") public var size
    @Field<Int>("strengthScore") public var strengthScore
    @Field<GraphQLEnum<DnD5eAPI.MonsterType>>("type") public var type
    @Field<Int>("wisdomScore") public var wisdomScore
  }
}

public extension Mock where O == Monster {
  convenience init(
    alignment: String? = nil,
    charismaScore: Int? = nil,
    constitutionScore: Int? = nil,
    description: String? = nil,
    dexterityScore: Int? = nil,
    id: String? = nil,
    imagePath: String? = nil,
    intelligenceScore: Int? = nil,
    name: String? = nil,
    size: GraphQLEnum<DnD5eAPI.Size>? = nil,
    strengthScore: Int? = nil,
    type: GraphQLEnum<DnD5eAPI.MonsterType>? = nil,
    wisdomScore: Int? = nil
  ) {
    self.init()
    _setScalar(alignment, for: \.alignment)
    _setScalar(charismaScore, for: \.charismaScore)
    _setScalar(constitutionScore, for: \.constitutionScore)
    _setScalar(description, for: \.description)
    _setScalar(dexterityScore, for: \.dexterityScore)
    _setScalar(id, for: \.id)
    _setScalar(imagePath, for: \.imagePath)
    _setScalar(intelligenceScore, for: \.intelligenceScore)
    _setScalar(name, for: \.name)
    _setScalar(size, for: \.size)
    _setScalar(strengthScore, for: \.strengthScore)
    _setScalar(type, for: \.type)
    _setScalar(wisdomScore, for: \.wisdomScore)
  }
}
