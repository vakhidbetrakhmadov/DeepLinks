public struct AnyType: Hashable {
    private let type: String
    
    public init(_ type: Any.Type) {
        self.type = String(reflecting: type)
    }
}
