import UIKit

final class SearchQiitaViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    var presenter: SearchQiitaPresentation?
    private var qiitaList: [QiitaEntity?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    } 
}

private extension SearchQiitaViewController {
    @IBAction func showQiitaList(_ sender: Any) {
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
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SearchQiitaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
