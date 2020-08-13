import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setParams(_ url: URL, _ str: String) {
        Nuke.loadImage(with: url, into: areaImageView)
        label.text = str
    }
}
