import UIKit

final class Question1ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValueOnTextView(value: "")
        self.setValueOnLabel(value: "")
        self.textField.delegate = self
    }
    
    // textFieldの外がタップされた際にキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // returnがタップされた際にキーボードを閉じる
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // addTextButtonイベント
    @IBAction func addText(_ sender: Any) {
        if let addStr = self.getValueOnTextField(), !addStr.isEmpty {
            self.setValueOnLabel(value: "")
            let currentStr = self.getValueOnTextView()
            let replaceStr = currentStr + (!currentStr.isEmpty ? "\n" : "") + addStr
            self.setValueOnTextView(value: replaceStr)
        } else {
            self.setValueOnLabel(value: "文字を入力してください")
        }
    }
    
    // clearTextButtonイベント
    @IBAction func clearText(_ sender: Any) {
        self.setValueOnTextView(value: "")
    }
    
    // labelに文字列をセットする
    private func setValueOnLabel(value: String) {
        self.label.text = value
    }
    
    // textFieldの文字列を取得する
    private func getValueOnTextField() -> String? {
        return self.textField.text
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
