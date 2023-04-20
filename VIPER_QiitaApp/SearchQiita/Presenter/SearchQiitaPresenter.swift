import Foundation

final class SearchQiitaPresenter {
    weak var view: SearchQiitaView?
    var interactor: SearchQiitaInputUsecase?
    var router: SearchQiitaWireFrame?

    init(view: SearchQiitaView? = nil,
        interactor: SearchQiitaInputUsecase? = nil,
        router: SearchQiitaWireFrame? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchQiitaPresenter: SearchQiitaPresentation {
    func viewDidLoad() {
    }
    /// 検索ボタン押されたら通知。 View → Interactor
    func searchButtonDidTapped(text: String) {
        Task {
            guard let qiitaList = await interactor?.fetchQiitaArticle(searchText: text) else { return }

            switch qiitaList {
            case .success(let qiitaList):
                view?.tableViewReload(qiitaList: qiitaList)
            case .failure(let apiError):
                print(apiError.localizedDescription)
            }
        }
    }
    /// セルボタンを押したら通知  View → Router
    func didSelectRow(qiitaArticle: QiitaEntity) {
    }
}

extension SearchQiitaPresenter: SearchQiitaOutputUsecase {
    /// Qiita記事を取得したら通知。 Interactor → View
    func didFetchQiitaArticle(qiitaList: [QiitaEntity]) {
        view?.tableViewReload(qiitaList: qiitaList)
    }
}
