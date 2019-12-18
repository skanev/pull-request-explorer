import Foundation

extension Bundle {
  var githubToken: String { infoDictionary!["GITHUB_TOKEN"] as! String }
}
