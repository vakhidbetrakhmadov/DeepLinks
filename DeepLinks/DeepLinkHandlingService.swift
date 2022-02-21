public protocol DeepLinkHandlingService {
    func handle(deepLinkUri: DeepLinkUri)
    func handle<T: DeepLink>(deepLink: T)
}
