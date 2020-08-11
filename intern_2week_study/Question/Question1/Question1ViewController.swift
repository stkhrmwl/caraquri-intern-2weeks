import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValueOnTextView(value: "")
    }
    
    private func setValueOnTextView(value: String) {
        self.textView.text = value
    }
}
