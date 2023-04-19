import UIKit
// View
protocol SearchQiitaView: AnyObject {
    var presenter: SearchQiitaPresentation? { get set }
    func tableViewReload()
}
// Pesenter
protocol SearchQiitaPresentation: AnyObject {
    var view: SearchQiitaView? { get set }
    var interactor: SearchQiitaInputUsecase? { get set }
    var router: SearchQiitaWireFrame? { get set }
    func viewDidLoad()
    ///  検索ボタンタップ通知。
    func searchButtonDidTapped(text: String)
    ///  セルタップ通知。
    func didSelectRow(qiitaArticle: QiitaEntity)
}
// Interactor インプット
protocol SearchQiitaInputUsecase: AnyObject {
    var output: SearchQiitaOutputUsecase? { get set }
    /// データベースからQiita記事(JSON)を取得
    func fetchQiitaArticle()
}
// Interactor アウトプット
protocol SearchQiitaOutputUsecase: AnyObject {
    /// JSONデータをQiita記事に変換しリスト化
    func convertQiitaArticleList(qiitaList: [QiitaEntity])
}
// Router
protocol SearchQiitaWireFrame: AnyObject {
    static func assembleModuls() -> UIViewController
    func showQiitaWeb(qiitaURL: String)
}





















// swiftlint:disable all
// View
//protocol TodoListView: AnyObject {
//    var presenter: TodoListPresentation? { get set }
//    func loadTodoList(_ todo: [TodoListEntity])
//}
//
//// Interactor input
//protocol TodoListInputUsecase: AnyObject {
//    var output: TodoListOutputUsecase? { get set }
//    func fetchTodoList()
//}
//
//// Interactor output
//protocol TodoListOutputUsecase: AnyObject {
//    func loadTodoList(_ todoList: [TodoListEntity])
//}
//
//// Presenter
//protocol TodoListPresentation: AnyObject {
//    var view: TodoListView? { get set }
//    var interactor: TodoListInputUsecase { get set }
//    var router: TodoListWireFrame { get set }
//    func viewWillAppear()
//    func didSelectRow(_ tapedRowIndex: Int)
//}
//
//// Router
//protocol TodoListWireFrame: AnyObject {
//    static func assembleModules() -> UIViewController
//    func showDetailVC(_ tappedRowIndex: Int)
//}
