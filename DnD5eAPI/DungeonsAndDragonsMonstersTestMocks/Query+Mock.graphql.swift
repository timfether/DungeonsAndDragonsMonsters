// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import DnD5eAPI

public class Query: MockObject {
  public static let objectType: ApolloAPI.Object = DnD5eAPI.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<[Monster]>("monsters") public var monsters
  }
}

public extension Mock where O == Query {
  convenience init(
    monsters: [Mock<Monster>]? = nil
  ) {
    self.init()
    _setList(monsters, for: \.monsters)
  }
}
