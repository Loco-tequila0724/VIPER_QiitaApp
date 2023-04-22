import Foundation

final class SearchQiitaInteractor {
    weak var presenter: SearchQiitaOutputUsecase?
    private let decoder = JSONDecoder()

}

extension SearchQiitaInteractor: SearchQiitaInputUsecase {
    /// API通信。データベースよりQiita記事の取得
    func fetchQiitaArticle(searchText: String) async {
        guard let url: URL = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20&query=\(searchText)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        var qiitaResult: (Result<[QiitaEntity?], ApiError>)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                return
            }
            let qiitaList = try decoder.decode([QiitaEntity].self, from: data)
            qiitaResult = .success(qiitaList)
            presenter?.didFetchQiitaResult(result: qiitaResult)
        } catch {
            qiitaResult = .failure(.networkError)
            presenter?.didFetchQiitaResult(result: qiitaResult)
        }
    }
}
