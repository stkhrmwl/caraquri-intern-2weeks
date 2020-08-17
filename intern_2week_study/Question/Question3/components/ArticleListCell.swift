import Nuke
import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    public func setElements(_ article: Article) {
        titleTextLabel.text = article.title
        descriptionTextLabel.text = "LGTM: " +  String(article.likesCount)
        guard let urlStr = article.user?.profileImageUrl, let url = URL(string: urlStr) else {
            return
        }
        Nuke.loadImage(with: url, into: userImageView)
    }
    
}
