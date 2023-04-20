import UIKit

protocol QiitaArticleView: AnyObject {
    var presenter: QiitaArticlePresentation? { get set }
    func configure(urlRequest: URLRequest)
}

protocol QiitaArticlePresentation: AnyObject {
    var view: QiitaArticleView? { get set }
    var router: QiitaArticleWireFrame? { get set }
    func viewDidLoad()
}

protocol QiitaArticleWireFrame: AnyObject {
    static func assembleModules(qiita: QiitaEntity) -> UIViewController
}
