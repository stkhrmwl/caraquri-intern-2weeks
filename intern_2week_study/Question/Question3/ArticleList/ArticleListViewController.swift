import SafariServices
import UIKit

final class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(R.nib.articleListCell)
    }
    
    public func setArticles(articles: [Article]) {
        self.articles = articles
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.articleListCell, for: indexPath), let article = articles[safe: indexPath.row] else {
            return UITableViewCell()
        }
        cell.setElements(article)
        return cell
    }
    
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableVIew: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlStr = articles[safe: indexPath.row]?.url, let url = URL(string: urlStr) else {
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
