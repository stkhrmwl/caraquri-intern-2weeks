import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func runSearch(_ sender: Any) {
        searchArticles()
    }
    
    private func searchArticles() {
        
        guard let text = searchTextField.text, !text.isEmpty else {
            return
        }
        
        APIClient.fetchArticles(keyword: text) { [weak self] result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.showArticleListScreen(articles)
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)
                }
            }
        }
    }
    
    private func showArticleListScreen(_ articles: [Article]) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ArticleList", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "articleList") as? ArticleListViewController else {
            return
        }
        nextViewController.setArticles(articles: articles)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
