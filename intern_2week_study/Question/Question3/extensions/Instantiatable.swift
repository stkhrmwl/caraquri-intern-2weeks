import UIKit

protocol Instantiatable {
    static func instantiateFromStoryboard() -> Self
}

extension Instantiatable where Self: UIViewController {
    static func instantiateFromStoryboard() -> Self {
        let className = String(describing: type(of: self)).replacingOccurrences(of: ".Type", with: "")
        let storyboardName = className.replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: storyboardName) as? Self else {
            fatalError("Error in \"Instantiatable\"")
        }
        return vc
    }
}
