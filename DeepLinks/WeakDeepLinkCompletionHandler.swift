public final class WeakDeepLinkCompletionHandler: DeepLinkCompletionHandler {
    private weak var deepLinkCompletionHandler: (AnyObject & DeepLinkCompletionHandler)?
    
    public init(deepLinkCompletionHandler: AnyObject & DeepLinkCompletionHandler) {
        self.deepLinkCompletionHandler = deepLinkCompletionHandler
    }
    
    public func handleDeepLinkCompletion(args: DeepLinkCompletionArgs) {
        deepLinkCompletionHandler?.handleDeepLinkCompletion(args: args)
    }
}
