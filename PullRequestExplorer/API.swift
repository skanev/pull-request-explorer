//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MyRepositoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query MyRepositories {
      viewer {
        __typename
        login
        repositories(first: 50) {
          __typename
          nodes {
            __typename
            id
            nameWithOwner
            viewerHasStarred
          }
        }
      }
    }
    """

  public let operationName = "MyRepositories"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositories", arguments: ["first": 50], type: .nonNull(.object(Repository.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String, repositories: Repository) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login, "repositories": repositories.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "repositories")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
            GraphQLField("viewerHasStarred", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, nameWithOwner: String, viewerHasStarred: Bool) {
            self.init(unsafeResultMap: ["__typename": "Repository", "id": id, "nameWithOwner": nameWithOwner, "viewerHasStarred": viewerHasStarred])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The repository's name with owner.
          public var nameWithOwner: String {
            get {
              return resultMap["nameWithOwner"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nameWithOwner")
            }
          }

          /// Returns a boolean indicating whether the viewing user has starred this starrable.
          public var viewerHasStarred: Bool {
            get {
              return resultMap["viewerHasStarred"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "viewerHasStarred")
            }
          }
        }
      }
    }
  }
}

public final class AddStarMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation AddStar($id: ID!) {
      addStar(input: {starrableId: $id}) {
        __typename
        starrable {
          __typename
          id
        }
      }
    }
    """

  public let operationName = "AddStar"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addStar", arguments: ["input": ["starrableId": GraphQLVariable("id")]], type: .object(AddStar.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addStar: AddStar? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addStar": addStar.flatMap { (value: AddStar) -> ResultMap in value.resultMap }])
    }

    /// Adds a star to a Starrable.
    public var addStar: AddStar? {
      get {
        return (resultMap["addStar"] as? ResultMap).flatMap { AddStar(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addStar")
      }
    }

    public struct AddStar: GraphQLSelectionSet {
      public static let possibleTypes = ["AddStarPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("starrable", type: .object(Starrable.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(starrable: Starrable? = nil) {
        self.init(unsafeResultMap: ["__typename": "AddStarPayload", "starrable": starrable.flatMap { (value: Starrable) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The starrable.
      public var starrable: Starrable? {
        get {
          return (resultMap["starrable"] as? ResultMap).flatMap { Starrable(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "starrable")
        }
      }

      public struct Starrable: GraphQLSelectionSet {
        public static let possibleTypes = ["Repository", "Gist", "Topic"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeRepository(id: GraphQLID) -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Repository", "id": id])
        }

        public static func makeGist(id: GraphQLID) -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Gist", "id": id])
        }

        public static func makeTopic(id: GraphQLID) -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Topic", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class RemoveStarMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation RemoveStar($id: ID!) {
      removeStar(input: {starrableId: $id}) {
        __typename
        starrable {
          __typename
          id
        }
      }
    }
    """

  public let operationName = "RemoveStar"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("removeStar", arguments: ["input": ["starrableId": GraphQLVariable("id")]], type: .object(RemoveStar.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeStar: RemoveStar? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeStar": removeStar.flatMap { (value: RemoveStar) -> ResultMap in value.resultMap }])
    }

    /// Removes a star from a Starrable.
    public var removeStar: RemoveStar? {
      get {
        return (resultMap["removeStar"] as? ResultMap).flatMap { RemoveStar(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeStar")
      }
    }

    public struct RemoveStar: GraphQLSelectionSet {
      public static let possibleTypes = ["RemoveStarPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("starrable", type: .object(Starrable.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(starrable: Starrable? = nil) {
        self.init(unsafeResultMap: ["__typename": "RemoveStarPayload", "starrable": starrable.flatMap { (value: Starrable) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The starrable.
      public var starrable: Starrable? {
        get {
          return (resultMap["starrable"] as? ResultMap).flatMap { Starrable(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "starrable")
        }
      }

      public struct Starrable: GraphQLSelectionSet {
        public static let possibleTypes = ["Repository", "Gist", "Topic"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeRepository(id: GraphQLID) -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Repository", "id": id])
        }

        public static func makeGist(id: GraphQLID) -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Gist", "id": id])
        }

        public static func makeTopic(id: GraphQLID) -> Starrable {
          return Starrable(unsafeResultMap: ["__typename": "Topic", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}
