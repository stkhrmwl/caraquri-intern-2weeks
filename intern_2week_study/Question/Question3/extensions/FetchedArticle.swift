class FetchedArticl {
    
    static private var articles: [Article]!
    
    public static func setArticles(_ articles: [Article]) {
        self.articles = articles
    }
    
    public static func getArticles() -> [Article] {
        return articles
    }
}
