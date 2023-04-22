//import XCTest
//@testable import VIPER_QiitaApp
//// swiftlint:disable all
//
//final class VIPER_QiitaAppTests: XCTestCase {
//    var interactor: SearchQiitaInputUsecase!
//    var presenter: SearchQiitaPresentation!
//
//    override func setUpWithError() throws {
//        print("テストのセットアップ")
//        interactor = TestSearchQiitaInteractor()
//        presenter = SearchQiitaPresenter(interactor: interactor)
//        interactor.presenter = presenter as? any SearchQiitaOutputUsecase
//    }
//
//    func test_FetchQiitaDataFromDB() {
//        Task {
//            print("テスト実行")
//            await interactor.fetchQiitaArticle(searchText: "swift")
//            interactor.convertQiitaList()
//        }
//    }
//
//    override func tearDownWithError() throws {
//        print("テスト終了")
//    }
//}
//
//
//class TestSearchQiitaInteractor: SearchQiitaInputUsecase {
//    var presenter: SearchQiitaOutputUsecase?
//    let decoder = JSONDecoder()
//    var qiitaRepository: (Result<[QiitaEntity?], ApiError>)?
//
//    ///  取得したQiitaの結果を返す
//    func convertQiitaList() {
//        print(#function)
//        guard let qiitaRepository else { return }
//        switch qiitaRepository {
//        case .success(let qiitaList):
//            let qiitaList = qiitaList.compactMap { $0 }
//            print(qiitaList)
//            presenter?.didFetchQiitaResult(qiitaList: qiitaList)
//        case .failure(let apiError):
//            print(apiError.localizedDescription)
//        }
//    }
//    /// API通信。データベースよりQiita記事の取得
//    func fetchQiitaArticle(searchText: String) async {
//        print(#function)
//        guard let url: URL = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20&query=\(searchText)") else {
//            qiitaRepository = .failure(.notFound)
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        do {
//            print("●～* 1")
//            let (data, response) = try await URLSession.shared.data(for: request)
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                httpResponse.statusCode == 200 else {
//                qiitaRepository = .failure(.serverError)
//                print("エラーー")
//                return
//            }
//            let qiitaList = try decoder.decode([QiitaEntity].self, from: data)
//            qiitaRepository = .success(qiitaList)
//            print("●～* 2")
//        } catch {
//            print("●～* 3")
//            qiitaRepository = .failure(.networkError)
//        }
//    }
//}
//
//class TestSearchQiitaPresenter: SearchQiitaPresentation {
//    var view: SearchQiitaView?
//
//    var interactor: SearchQiitaInputUsecase?
//
//    var router: SearchQiitaWireFrame?
//
//    func viewDidLoad() {
//    }
//
//    func searchButtonDidTapped(text: String) {
//        <#code#>
//    }
//
//    func didSelectRow(qiita: VIPER_QiitaApp.QiitaEntity) {
//        <#code#>
//    }
//}
