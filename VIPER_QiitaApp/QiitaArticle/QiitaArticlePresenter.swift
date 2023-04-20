import Foundation

class QiitaArticlePresenter {
    var view: QiitaArticleView?
    var presenter: QiitaArticlePresentation?
    var router: QiitaArticleWireFrame?
}

extension QiitaArticlePresenter: QiitaArticlePresentation {
    func viewDidLoad() {
    }

    func backButtonDidTapped() {
    }
}
