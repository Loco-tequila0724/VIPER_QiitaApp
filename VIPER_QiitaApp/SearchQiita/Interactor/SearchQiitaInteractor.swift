import Foundation

final class SearchQiitaInteractor {
    weak var presenter: SearchQiitaOutputUsecase?
    private let decoder = JSONDecoder()
}

extension SearchQiitaInteractor: SearchQiitaInputUsecase {
    func fetchQiitaArticle(searchText: String) async -> (Result<[QiitaEntity?], ApiError>) {
        guard let url: URL = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20&query=\(searchText)") else {
            return .failure(.notFound)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else { return .failure(.serverError) }
            let qiitaList = try decoder.decode([QiitaEntity].self, from: data)
            return .success(qiitaList)
        } catch {
            return .failure(.networkError)
        }
    }
}
