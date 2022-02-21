import DependencyContainer

final class ClosureDeepLinkHandlerForDeepLinkFactory<T: DeepLink>: DeepLinkHandlerForDeepLinkFactory {
    private let deepLinkHandler: (T, DeepLinkHandlerBuilderArgsFactory) throws -> DeepLinkHandler
    
    init(deepLinkHandler: @escaping (T, DeepLinkHandlerBuilderArgsFactory) throws -> DeepLinkHandler) {
        self.deepLinkHandler = deepLinkHandler
    }
    
    func deepLinkHandler<D: DeepLink>(
        deepLink: D,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    ) throws -> DeepLinkHandler {
        guard let deepLink = deepLink as? T else {
            throw DeepLinksError("Expected deep link of type \(T.self), but got \(D.self)")
        }
        return try deepLinkHandler(deepLink, deepLinkHandlerBuilderArgsFactory)
    }
}
