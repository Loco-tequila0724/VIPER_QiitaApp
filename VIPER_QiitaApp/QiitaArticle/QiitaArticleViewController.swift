import UIKit
import WebKit

class QiitaArticleViewController: UIViewController {
    var presenter: QiitaArticlePresentation?
    static let storyboardID = "QiitaArticleID"
    private var request: URLRequest?
    @IBOutlet private weak var webkit: WKWebView!

    static func instantiate() -> QiitaArticleViewController {
        let storyboard = UIStoryboard(name: "QiitaArticle", bundle: Bundle.main)
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
    func configure(urlRequest: URLRequest) {
        webkit.load(urlRequest)
    }
}
