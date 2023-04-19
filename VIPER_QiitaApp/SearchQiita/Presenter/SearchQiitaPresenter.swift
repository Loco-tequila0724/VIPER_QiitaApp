import Foundation

final class SearchQiitaPresenter {
    weak var view: SearchQiitaView?
    var interactor: SearchQiitaInputUsecase?
    var router: SearchQiitaWireFrame?
}

extension SearchQiitaPresenter: SearchQiitaPresentation {
    func viewDidLoad() {
    }
    /// 検索ボタン押されたら通知。 View → Interactor
    func searchButtonDidTapped(text: String) {
        interactor?.fetchQiitaArticle(searchText: text)
    }
    /// セルボタンを押したら通知  View → Router
    func didSelectRow(qiitaArticle: QiitaEntity) {
    }
}

extension SearchQiitaPresenter: SearchQiitaOutputUsecase {
    /// Qiita記事を取得したら通知。 Interactor → View
    func didFetchQiitaArticle(qiitaList: [QiitaEntity]) {
        let qiitList = qiitaList
        view?.tableViewReload(qiitaList: qiitaList)
    }
}
