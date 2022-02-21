import Foundation
import DeepLinks

final class ItemsServiceImpl: ItemsService {
    func loadItems(completion: @escaping (Result<[Item], Error>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            let items = (0..<4).map { index in
                Item(
                    id: "\(index)",
                    title: "Item \(index)",
                    deepLinkUri: DeepLinkUri(string: "com.deeplinks://1/item/show?itemID=\(index)")!
                )
            }
            completion(.success(items))
        }
    }
    
    func itemStatus(itemID: String, completion: @escaping (Result<ItemStatus, Error>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            switch itemID {
            case "0":
                completion(.success(.active))
            case "1":
                completion(.success(.inactive))
            case "2":
                completion(.success(.removed(redirect: DeepLinkUri(string: "com.deeplinks://1/terms/show")!)))
            case "3":
                completion(.failure("Failed to fetch item status"))
            default:
                fatalError()
            }
        }
    }
}
