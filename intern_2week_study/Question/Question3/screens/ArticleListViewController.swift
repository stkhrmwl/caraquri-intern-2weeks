import SafariServices
import UIKit

final class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articles: [Article]!
    
    static func instantiate(_ articles: [Article]) -> ArticleListViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "ArticleList", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "articleList") as? ArticleListViewController else {
            return ArticleListViewController()
        }
        nextViewController.articles = articles
        return nextViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 48
        tableView.register(R.nib.articleListCell)
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
        cell.set(article)
        return cell
    }
    
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlStr = articles[safe: indexPath.row]?.url, let url = URL(string: urlStr) else { return }
        present(SFSafariViewController(url: url), animated: true)
    }
}
