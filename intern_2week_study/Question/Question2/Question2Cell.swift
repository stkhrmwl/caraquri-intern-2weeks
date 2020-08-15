import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var areaImageView: UIImageView!
    
    public func setArea(name: String, imageURL: URL) {
        label.text = name
        Nuke.loadImage(with: imageURL, into: areaImageView)
    }
    
    public func getLabel() -> String? {
        return label.text
    }
}
