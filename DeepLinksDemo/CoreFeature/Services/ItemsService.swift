protocol ItemsService {
    func loadItems(completion: @escaping (Result<[Item], Error>) -> ())
    func itemStatus(itemID: String, completion: @escaping (Result<ItemStatus, Error>) -> ())
}
