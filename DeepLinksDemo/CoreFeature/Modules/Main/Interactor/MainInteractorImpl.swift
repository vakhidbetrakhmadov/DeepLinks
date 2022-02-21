final class MainInteractorImpl: MainInteractor {
    private let itemsService: ItemsService
    
    init(itemsService: ItemsService) {
        self.itemsService = itemsService
    }
    
    private(set) var items: [Item] = []
    
    func loadItems(completion: @escaping (Error?) -> ()) {
        itemsService.loadItems { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
