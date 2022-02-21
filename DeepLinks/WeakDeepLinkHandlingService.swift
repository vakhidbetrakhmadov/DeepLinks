public final class WeakDeepLinkHandlingService: DeepLinkHandlingService {
    private weak var deepLinkHandlingService: (AnyObject & DeepLinkHandlingService)?
    
    public init(deepLinkHandlingService: AnyObject & DeepLinkHandlingService) {
        self.deepLinkHandlingService = deepLinkHandlingService
    }
    
    public func handle(deepLinkUri: DeepLinkUri) {
        deepLinkHandlingService?.handle(deepLinkUri: deepLinkUri)
    }
    
    public func handle<T: DeepLink>(deepLink: T) {
        deepLinkHandlingService?.handle(deepLink: deepLink)
    }
}
