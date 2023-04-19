import UIKit

class QiitaListTableViewCell: UITableViewCell {
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    func configure(userImage: UIImage, title: String) {
        userImageView.image = userImage
        titleLabel.text = title
    }
}
