import Foundation

class QiitaArticlePresenter {
    weak var view: QiitaArticleView?
    var router: QiitaArticleWireFrame?
    var qiitaArticle: QiitaEntity?

    init(
        view: QiitaArticleView? = nil,
        router: QiitaArticleWireFrame? = nil,
        qiitaArticle: QiitaEntity? = nil) {
        self.view = view
        self.router = router
        self.qiitaArticle = qiitaArticle
    }
}

extension QiitaArticlePresenter: QiitaArticlePresentation {
    func viewDidLoad() {
        guard let url = URL(string: qiitaArticle?.url ?? "") else { return }
        let urlRequest = URLRequest(url: url)
        view?.configure(urlRequest: urlRequest)
    }
}
