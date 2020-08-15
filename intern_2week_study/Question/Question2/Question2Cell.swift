import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet private(set) weak var areaNameLabel: UILabel!
    @IBOutlet private weak var areaImageView: UIImageView!
    
    public func setArea(name: String, imageURL: URL) {
        areaNameLabel.text = name
        Nuke.loadImage(with: imageURL, into: areaImageView)
    }
    
}
