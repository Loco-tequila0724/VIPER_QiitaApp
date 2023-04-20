import UIKit
import WebKit

class QiitaArticleViewController: UIViewController {
    var presenter: QiitaArticlePresentation?
    static let storyboardID = "QiitaArticleID"

    static func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: "QiiaArticle", bundle: Bundle.main)
        guard let view = storyboard.instantiateViewController(withIdentifier: storyboardID) as? QiitaArticleViewController else {
            return QiitaArticleViewController() }
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension QiitaArticleViewController: QiitaArticleView {
    func configure() {
    }
}
