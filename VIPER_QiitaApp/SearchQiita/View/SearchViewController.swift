import UIKit

class SearchQiitaViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.text = "俺的、VIPERアーキテクチャ"
        }
    }
    @IBOutlet weak var searchInfoLabel: UILabel!{
        didSet{
            self.searchInfoLabel.text = "Qiita記事を検索🐍"
        }
    }

    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

