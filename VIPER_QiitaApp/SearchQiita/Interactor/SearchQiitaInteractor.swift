import Foundation

final class SearchQiitaInteractor {
    weak var output: SearchQiitaOutputUsecase?
}

extension SearchQiitaInteractor: SearchQiitaInputUsecase {
    func fetchQiitaArticle(searchText: String) async -> [QiitaEntity?] {
        return []
    }
}
