import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var areaImageView: UIImageView!
    
    public func setParams(_ url: URL, _ str: String) {
        Nuke.loadImage(with: url, into: areaImageView)
        label.text = str
    }
    
    public func getLabel() -> String? {
        return label.text
    }
}
