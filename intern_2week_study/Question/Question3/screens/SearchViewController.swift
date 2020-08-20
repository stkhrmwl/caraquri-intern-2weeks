import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchArticles(_ sender: Any) {
        guard let keyword = searchTextField.text, !keyword.isEmpty else { return }
        
        APIClient.fetchArticles(keyword: keyword) { [weak self] result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    FetchedArticl.setArticles(articles)
                    self?.navigateArticleListScreen()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func navigateArticleListScreen() {
        let vc = ArticleListViewController.instantiateFromStoryboard()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
