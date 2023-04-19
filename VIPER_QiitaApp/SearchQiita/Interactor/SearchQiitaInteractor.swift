import Foundation

final class SearchQiitaInteractor {
    weak var presenter: SearchQiitaOutputUsecase?
}

extension SearchQiitaInteractor: SearchQiitaInputUsecase {
    func fetchQiitaArticle(searchText: String) {
    }
}
