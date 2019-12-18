import Apollo
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  typealias Repository = MyRepositoriesQuery.Data.Viewer.Repository.Node

  @IBOutlet private var tableView: UITableView!

  private var repositories: [Repository] = []

  override func viewDidLoad() {
    _ = Network.shared.apollo.watch(query: MyRepositoriesQuery()) { result in
      switch result {
      case .success(let response):
        self.repositories = response.data!.viewer.repositories.nodes!.map { $0! }
        self.tableView.reloadData()
      case .failure(let error):
        fatalError(error.localizedDescription)
      }
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    repositories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as! RepositoryCell
    cell.bind(repository: repositories[indexPath.row])
    return cell
  }
}

class RepositoryCell: UITableViewCell {
  typealias Repository = MyRepositoriesQuery.Data.Viewer.Repository.Node

  @IBOutlet private var name: UILabel!
  @IBOutlet private var star: UIButton!

  private var repository: Repository!

  @IBAction func onStar() {
    if repository.viewerHasStarred {
      Network.shared.apollo.perform(mutation: RemoveStarMutation(id: repository.id))
    } else {
      Network.shared.apollo.perform(mutation: AddStarMutation(id: repository.id))
    }
  }

  func bind(repository: Repository) {
    self.repository = repository
    self.name.text = repository.nameWithOwner

    if repository.viewerHasStarred {
      star.setTitle("★", for: .normal)
    } else {
      star.setTitle("☆", for: .normal)
    }
  }
}
