public final class DeepLinkCompletionArgs {
    private let deepLink: Any
    private let result: Any
    
    init<T: DeepLink>(deepLink: T, result: T.Result) {
        self.deepLink = deepLink
        self.result = result
    }
    
    public func on<T: DeepLink>(_ deepLinkType: T.Type) -> (deepLink: T, result: T.Result)? {
        if let deepLink = deepLink as? T, let result = result as? T.Result {
            return (deepLink, result)
        } else {
            return nil
        }
    }
}

public extension DeepLinkCompletionArgs {
    func on<T: DeepLink>(_ deepLinkType: T.Type) -> T? where T.Result == Void {
        on(T.self)?.0
    }
}
