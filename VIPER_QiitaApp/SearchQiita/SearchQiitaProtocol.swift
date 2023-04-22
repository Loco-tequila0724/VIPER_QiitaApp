import UIKit
// View
protocol SearchQiitaView: AnyObject {
    var presenter: SearchQiitaPresentation? { get set }
    func tableViewReload()
    func configure()
    func startLoading()
    func stopLoading()
}
// Pesenter
protocol SearchQiitaPresentation: AnyObject {
    var view: SearchQiitaView? { get set }
    var interactor: SearchQiitaInputUsecase? { get set }
    var router: SearchQiitaWireFrame? { get set }
    var qiitaList: [QiitaEntity] { get }

    func viewDidLoad()
    ///  検索ボタンタップ通知 。
    func searchButtonDidTapped(text: String)
    ///  セルタップ通知。
    func didSelectRow(qiita: QiitaEntity)
}
// Interactor インプット
protocol SearchQiitaInputUsecase: AnyObject {
    var presenter: SearchQiitaOutputUsecase? { get set }
    /// データベースからQiita記事(JSON)を取得
    func fetchQiitaArticle(searchText: String) async
}
// Interactor アウトプット
protocol SearchQiitaOutputUsecase: AnyObject {
    /// Qiitaの取得の結果をinteractorから取り → Presenterで変換
    func didFetchQiitaResult(result: Result<[QiitaEntity?], ApiError>)
}
// Router
protocol SearchQiitaWireFrame: AnyObject {
    static func assembleModules() -> UIViewController
    func showQiitaWeb(qiita: QiitaEntity)
}
