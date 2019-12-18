import Apollo

class Network {
  static let shared = Network()

  private lazy var networkTransport = HTTPNetworkTransport(
    url: URL(string: "https://api.github.com/graphql")!,
    delegate: self
  )

  // Use the configured network transport in your Apollo client.
  private(set) lazy var apollo: ApolloClient = {
    let client = ApolloClient(networkTransport: self.networkTransport)
    client.cacheKeyForObject = { $0["id"] }
    return client
  }()
}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
    true
  }

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {

    // Get the existing headers, or create new ones if they're nil
    var headers = request.allHTTPHeaderFields ?? [String: String]()

    // Add any new headers you need
    headers["Authorization"] = "Bearer \(Bundle.main.githubToken)"

    // Re-assign the updated headers to the request.
    request.allHTTPHeaderFields = headers
  }
}
