import UIKit

class QiitaArticleViewController: UIViewController {
    var presenter: QiitaArticlePresentation?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension QiitaArticleViewController: QiitaArticleView {
    func configure() {

    }
}
