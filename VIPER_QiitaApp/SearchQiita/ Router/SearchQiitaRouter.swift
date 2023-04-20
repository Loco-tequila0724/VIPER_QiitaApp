import UIKit

final class SearchQiitaRouter {
    var viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension SearchQiitaRouter: SearchQiitaWireFrame {
    static func assembleModuls() -> UIViewController {
        let view = SearchQiitaViewController.instantiate()
        let interactor = SearchQiitaInteractor()
        let router = SearchQiitaRouter(viewController: view)
        let presenter = SearchQiitaPresenter(
            view: view,
            interactor: interactor,
            router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }

    func showQiitaWeb(qiitaURL: String) {
    }
}
