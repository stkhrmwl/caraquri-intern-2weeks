import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValueOnTextView(value: "")
    }

    // addTextButtonイベント
    @IBAction func addText(_ sender: Any) {
        let replaceValue = self.getValueOnTextView() + "\n" + self.getValueOnTextField()
        self.setValueOnTextView(value: replaceValue)
    }
    
    // clearTextButtonイベント
    @IBAction func clearText(_ sender: Any) {
        self.setValueOnTextView(value: "")
    }
    
    // textFieldの文字列を取得する
    private func getValueOnTextField() -> String {
        return self.textField.text!
    }
    
    // textViewの文字列を取得する
    private func getValueOnTextView() -> String {
        return self.textView.text
    }
    
    // textViewに文字列をセットする
    private func setValueOnTextView(value: String) {
        self.textView.text = value
    }
}
