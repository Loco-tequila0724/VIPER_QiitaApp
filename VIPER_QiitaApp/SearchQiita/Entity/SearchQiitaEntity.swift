import Foundation

struct QiitaEntity: Codable {
    let title: String
    let url: String
    let user: User

    enum CodingKeys: CodingKey {
        case title
        case url
        case user
    }

    struct User: Codable {
        let profileImageURL: String

        enum CodingKeys: String, CodingKey { // swiftlint:disable:this all
            case profileImageURL = "profile_image_url"
        }
    }
}
