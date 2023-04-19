import Foundation

final class SearchQiitaPresenter {
    weak var view: SearchQiitaView?
    var interactor: SearchQiitaInputUsecase?
    var router: SearchQiitaWireFrame?
}

extension SearchQiitaPresenter: SearchQiitaPresentation {
    func viewDidLoad() {
    }

    func searchButtonDidTapped(text: String) {
        let searchText = text
        Task {
            guard let qiitaArray = await interactor?.fetchQiitaArticle(searchText: searchText) else { return }
            view?.tableViewReload(qiitaList: qiitaArray)
        }
    }

    func didSelectRow(qiitaArticle: QiitaEntity) {
    }
}

extension SearchQiitaPresenter: SearchQiitaOutputUsecase {
    func convertQiitaArticleList(qiitaList: [QiitaEntity]) {
    }
}
