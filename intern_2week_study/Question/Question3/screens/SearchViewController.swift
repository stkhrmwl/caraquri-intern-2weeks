import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private var articles: [Article]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchArticles(_ sender: Any) {
        guard let keyword = searchTextField.text, !keyword.isEmpty else { return }
        
        APIClient.fetchArticles(keyword: keyword) { [weak self] result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.navigateArticleListScreen()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func navigateArticleListScreen() {
        let vc = ArticleListViewController.instantiate(articles)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
