import UIKit

final class SearchQiitaViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    var presenter: SearchQiitaPresentation?
    static let storyboardID = "SearchQiitaID"
    private var qiitaList: [QiitaEntity?] = []

    static func instantiate() -> SearchQiitaViewController {
        let storyboard = UIStoryboard(name: storyboardID, bundle: Bundle.main)
        guard let view = storyboard.instantiateViewController(withIdentifier: storyboardID) as? SearchQiitaViewController else {
            return SearchQiitaViewController()
        }
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

private extension SearchQiitaViewController {
    @IBAction func showQiitaList(_ sender: Any) {
        guard let text = searchBar.text else { return }
        presenter?.searchButtonDidTapped(text: text)
        searchBar.resignFirstResponder()
    }
}

extension SearchQiitaViewController: SearchQiitaView {
    func tableViewReload(qiitaList: [QiitaEntity?]) {
        self.qiitaList = qiitaList
        tableView.reloadData()
    }
}

extension SearchQiitaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitaList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QiitaListTableViewCell.identifier) as? QiitaListTableViewCell else { return UITableViewCell() }
        let qiitaArticle = qiitaList[indexPath.row]
        cell.configure(title: qiitaArticle?.title ?? "")

        let iamgeURL: URL = URL(string: qiitaArticle?.user.profileImageURL ?? "")!
        cell.userImage().loadImageAsynchronous(url: iamgeURL)

        return cell
    }
}

extension SearchQiitaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
