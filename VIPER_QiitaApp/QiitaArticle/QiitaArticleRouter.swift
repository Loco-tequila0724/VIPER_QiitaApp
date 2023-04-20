import UIKit

class QiitaArticleRouter {
    private let viewController: UIViewController
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension QiitaArticleRouter: QiitaArticleWireFrame {
    static func assembleModules(qiita: QiitaEntity) -> UIViewController {
        let view = QiitaArticleViewController.instantiate()
        let router = QiitaArticleRouter(viewController: view)
        let presenter = QiitaArticlePresenter(
            view: view,
            router: router,
            qiitaArticle: qiita)

        view.presenter = presenter
        return view
    }
}
