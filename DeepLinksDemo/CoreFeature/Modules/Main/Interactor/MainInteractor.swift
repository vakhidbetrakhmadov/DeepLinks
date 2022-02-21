protocol MainInteractor {
    var items: [Item] { get }
    
    func loadItems(completion: @escaping (Error?) -> ())
}
