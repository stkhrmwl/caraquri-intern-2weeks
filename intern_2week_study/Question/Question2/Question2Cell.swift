import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setLabel(_ str: String) {
        label.text = str
    }

    public func setImage(_ url: URL) {
        Nuke.loadImage(with: url, into: areaImageView)
    }
}
