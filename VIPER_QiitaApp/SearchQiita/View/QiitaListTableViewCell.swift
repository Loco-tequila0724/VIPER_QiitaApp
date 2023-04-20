import UIKit

final class QiitaListTableViewCell: UITableViewCell {
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    static let identifier = "QiitaListCell"

    func configure(title: String) {
        titleLabel.text = title
    }

    func userImage() -> UIImageView {
        return userImageView
    }
}
    