import Foundation

final class SearchQiitaPresenter {
    weak var view: SearchQiitaView?
    var interactor: SearchQiitaInputUsecase?
    var router: SearchQiitaWireFrame?

    init(
        view: SearchQiitaView? = nil,
        interactor: SearchQiitaInputUsecase? = nil,
        router: SearchQiitaWireFrame? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchQiitaPresenter: SearchQiitaPresentation {
    func viewDidLoad() {
        view?.configure()
    }
    /// 検索ボタン押されたら通知。 View → Interactor
    func searchButtonDidTapped(text: String) {
        view?.startLoading()
        Task {
            await interactor?.fetchQiitaArticle(searchText: text)
            interactor?.convertQiitaList()
        }
    }
    /// セルボタンを押したら通知  View → Router
    func didSelectRow(qiitaArticle: QiitaEntity) {
    }
}

extension SearchQiitaPresenter: SearchQiitaOutputUsecase {
    /// Qiita記事を取得したら通知。 Interactor → View
    func didFetchQiitaResult(qiitaList: [QiitaEntity]) {
        view?.stopLoading()
        view?.tableViewReload(qiitaList: qiitaList)
    }
}
