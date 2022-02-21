import Core

final class DeepLinkHandlerForDeepLinkFactoryImpl: DeepLinkHandlerForDeepLinkFactory {
    private let deepLinkHandlerFactoryRegistry: DeepLinkHandlerFactoryRegistry
    
    init(deepLinkHandlerFactoryRegistry: DeepLinkHandlerFactoryRegistry) {
        self.deepLinkHandlerFactoryRegistry = deepLinkHandlerFactoryRegistry
    }
    
    func deepLinkHandler<T: DeepLink>(
        deepLink: T,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    ) throws -> DeepLinkHandler {
        guard let deepLinkHandlerFactory = deepLinkHandlerFactoryRegistry.deepLinkHandlerForDeepLinkFactory(
            deepLinkType: T.self
        ) else {
            throw DeepLinksError("Could not find DeepLinkHandler for deep link of type \(T.self)")
        }
        return try deepLinkHandlerFactory.deepLinkHandler(
            deepLink: deepLink,
            deepLinkHandlerBuilderArgsFactory: deepLinkHandlerBuilderArgsFactory
        )
    }
}
