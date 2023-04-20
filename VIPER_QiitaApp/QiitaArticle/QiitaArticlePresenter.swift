import Foundation

class QiitaArticlePresenter {
    var view: QiitaArticleView?
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
        view?.configure()
    }

    func backButtonDidTapped() {
    }
}
