import Foundation

public extension URL {
    var queryItems: [URLQueryItem]? {
        URLComponents(string: absoluteString)?.queryItems
    }
}

public extension Array where Element == URLQueryItem {
    func itemValue(for name: String) throws -> String {
        guard let item = first(where: { $0.name == name }) else {
            throw "Didn't find URLQueryItem with name \(name)"
        }
        guard let value = item.value else {
            throw "URLQueryItem with name \(name) has no value"
        }
        return value
    }
    
    func itemValue(for name: String) -> String? {
        try? itemValue(for: name) as String
    }
}
