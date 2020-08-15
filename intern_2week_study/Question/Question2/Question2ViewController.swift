import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(R.nib.question2Cell)
        tableView.tableFooterView = UIView()
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.question2Cell, for: indexPath),
            let url = URL(string: "https://placehold.jp/36x36.png") else {
            return Question2Cell()
        }
        cell.setArea(name: areaTexts[indexPath.row], imageURL: url)
        return cell
    }
}

extension Question2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? Question2Cell {
            let alertController = UIAlertController(title: cell.areaNameLabel.text, message: "Press \"OK\"", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }
    }
}
