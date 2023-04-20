import UIKit

protocol QiitaArticleView {
    var presenter: QiitaArticlePresentation? { get set }
    func configure()
}

protocol QiitaArticlePresentation {
    var view: QiitaArticleView? { get set }
    var router: QiitaArticleWireFrame? { get set }
    func viewDidLoad()
    func backButtonDidTapped()
}

protocol QiitaArticleWireFrame {
    static func assembleModules() -> UIViewController
}
