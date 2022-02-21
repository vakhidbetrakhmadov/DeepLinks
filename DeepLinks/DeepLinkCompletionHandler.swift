public protocol DeepLinkCompletionHandler {
    func handleDeepLinkCompletion(args: DeepLinkCompletionArgs)
}

public extension DeepLinkCompletionHandler {
    func handleDeepLinkCompletion<T: DeepLink>(deepLink: T, result: T.Result) {
        handleDeepLinkCompletion(args: DeepLinkCompletionArgs(deepLink: deepLink, result: result))
    }
    
    func handleDeepLinkCompletion<T: DeepLink>(deepLink: T) where T.Result == Void {
        handleDeepLinkCompletion(args: DeepLinkCompletionArgs(deepLink: deepLink, result: ()))
    }
}
