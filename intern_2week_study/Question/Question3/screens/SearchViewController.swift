import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private var articles: [Article]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchArticles(_ sender: Any) {
        guard let keyword = searchTextField.text else { return }
        if keyword.isEmpty { return }
        
        APIClient.fetchArticles(keyword: keyword) { [weak self] result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.navigate()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func navigate() {
        let vc = ArticleListViewController.instantiateFromStoryboard()
        vc.setArticles(articles)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
