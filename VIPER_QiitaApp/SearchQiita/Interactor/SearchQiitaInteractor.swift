import Foundation

final class SearchQiitaInteractor {
    weak var presenter: SearchQiitaOutputUsecase?
    private let decoder = JSONDecoder()
    private var qiitaRepository: (Result<[QiitaEntity?], ApiError>)?
}

extension SearchQiitaInteractor: SearchQiitaInputUsecase {
    ///  取得したQiitaの結果を返す
    func convertQiitaList() {
        guard let qiitaRepository else { return }
        switch qiitaRepository {
        case .success(let qiitaList):
            let qiitaList = qiitaList.compactMap { $0 }
            print("🙆‍♂️",qiitaList.count)
            print(qiitaList.map { $0.user.profileImageURL })
            presenter?.didFetchQiitaResult(qiitaList: qiitaList)
        case .failure(let apiError):
            print(apiError.localizedDescription)
        }
    }
    /// API通信。データベースよりQiita記事の取得
    func fetchQiitaArticle(searchText: String) async {
        guard let url: URL = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20&query=\(searchText)") else {
            qiitaRepository = .failure(.notFound)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                qiitaRepository = .failure(.serverError)
                return
            }
            let qiitaList = try decoder.decode([QiitaEntity].self, from: data)
            qiitaRepository = .success(qiitaList)
        } catch {
            qiitaRepository = .failure(.networkError)
        }
    }
}
