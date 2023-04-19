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
    }

    func didSelectRow(qiitaArticle: QiitaEntity) {
    }
}

extension SearchQiitaPresenter: SearchQiitaOutputUsecase {
    func convertQiitaArticleList(qiitaList: [QiitaEntity]) {
    }
}
