import UIKit
// View
protocol SearchQiitaView: AnyObject {
    var presenter: SearchQiitaPresentation? { get set }
    func tableViewReload(qiitaList: [QiitaEntity?])
    func configure()
    func startLoading()
    func stopLoading()
}
// Pesenter
protocol SearchQiitaPresentation: AnyObject {
    var view: SearchQiitaView? { get set }
    var interactor: SearchQiitaInputUsecase? { get set }
    var router: SearchQiitaWireFrame? { get set }
    func viewDidLoad()
    ///  検索ボタンタップ通知 。
    func searchButtonDidTapped(text: String)
    ///  セルタップ通知。
    func didSelectRow(qiitaArticle: QiitaEntity)
}
// Interactor インプット
protocol SearchQiitaInputUsecase: AnyObject {
    var presenter: SearchQiitaOutputUsecase? { get set }
    /// データベースからQiita記事(JSON)を取得
    func fetchQiitaArticle(searchText: String) async
    /// 取得したデータをQiita記事へと変換
    func convertQiitaList()
}
// Interactor アウトプット
protocol SearchQiitaOutputUsecase: AnyObject {
    /// Qiita記事をinteractorから取り → Viewへ渡す
    func didFetchQiitaResult(qiitaList: [QiitaEntity])
}
// Router
protocol SearchQiitaWireFrame: AnyObject {
    static func assembleModules() -> UIViewController
    func showQiitaWeb(qiitaURL: String)
}
