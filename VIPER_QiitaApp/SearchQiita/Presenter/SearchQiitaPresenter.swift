import Foundation

final class SearchQiitaPresenter {
    weak var view: SearchQiitaView?
    var interactor: SearchQiitaInputUsecase?
    var router: SearchQiitaWireFrame?
    var qiitaList: [QiitaEntity] = []

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
        }
    }
    /// セルボタンを押したら通知  View → Router
    func didSelectRow(qiita: QiitaEntity) {
        router?.showQiitaWeb(qiita: qiita)
    }
}

extension SearchQiitaPresenter: SearchQiitaOutputUsecase {
    // Qiita記事を取得したら通知。 Interactor → View
    func didFetchQiitaResult(result: Result<[QiitaEntity?], ApiError>) {
        view?.stopLoading()
        switch result {
        case .success(let qiitaList):
            self.qiitaList = qiitaList.compactMap { $0 }
            view?.tableViewReload()
        case .failure(let error):
            // 本来ならエラー表示のアラートを発動 
            print(error.localizedDescription)
        }
    }
}
