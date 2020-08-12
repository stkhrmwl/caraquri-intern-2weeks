import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textView.text = ""
        label.text = ""
    }
    
    // textFieldの外がタップされた際にキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func addText(_ sender: Any) {
        guard let addStr = textField.text, addStr.isEmpty else {
            label.text = ""
            textView.text += (textView.text.isEmpty ? "" : "\n") + textField.text!
            return
        }
        label.text = "文字を入力してください"
    }
    
    @IBAction func removeAllText(_ sender: Any) {
        textView.text = ""
    }
}

extension Question1ViewController: UITextFieldDelegate {
    // returnがタップされた際にキーボードを閉じる
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
