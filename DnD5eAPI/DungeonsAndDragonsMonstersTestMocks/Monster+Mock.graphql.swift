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
    @Field<Int>("charisma") public var charisma
    @Field<Int>("constitution") public var constitution
    @Field<String>("description") public var description
    @Field<Int>("dexterity") public var dexterity
    @Field<String>("imagePath") public var imagePath
    @Field<String>("index") public var index
    @Field<Int>("intelligence") public var intelligence
    @Field<String>("name") public var name
    @Field<GraphQLEnum<DnD5eAPI.Size>>("size") public var size
    @Field<Int>("strength") public var strength
    @Field<GraphQLEnum<DnD5eAPI.MonsterType>>("type") public var type
    @Field<Int>("wisdom") public var wisdom
  }
}

public extension Mock where O == Monster {
  convenience init(
    alignment: String? = nil,
    charisma: Int? = nil,
    constitution: Int? = nil,
    description: String? = nil,
    dexterity: Int? = nil,
    imagePath: String? = nil,
    index: String? = nil,
    intelligence: Int? = nil,
    name: String? = nil,
    size: GraphQLEnum<DnD5eAPI.Size>? = nil,
    strength: Int? = nil,
    type: GraphQLEnum<DnD5eAPI.MonsterType>? = nil,
    wisdom: Int? = nil
  ) {
    self.init()
    _setScalar(alignment, for: \.alignment)
    _setScalar(charisma, for: \.charisma)
    _setScalar(constitution, for: \.constitution)
    _setScalar(description, for: \.description)
    _setScalar(dexterity, for: \.dexterity)
    _setScalar(imagePath, for: \.imagePath)
    _setScalar(index, for: \.index)
    _setScalar(intelligence, for: \.intelligence)
    _setScalar(name, for: \.name)
    _setScalar(size, for: \.size)
    _setScalar(strength, for: \.strength)
    _setScalar(type, for: \.type)
    _setScalar(wisdom, for: \.wisdom)
  }
}
