final class DeepLinkHandlerForDeepLinkUriFactoryImpl: DeepLinkHandlerForDeepLinkUriFactory {
    private let deepLinkHandlerFactoryRegistry: DeepLinkHandlerFactoryRegistry
    
    init(deepLinkHandlerFactoryRegistry: DeepLinkHandlerFactoryRegistry) {
        self.deepLinkHandlerFactoryRegistry = deepLinkHandlerFactoryRegistry
    }
    
    func deepLinkHandler(
        deepLinkUri: DeepLinkUri,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    ) throws -> DeepLinkHandler {
        guard let deepLinkHandlerFactory = deepLinkHandlerFactoryRegistry.deepLinkHandlerForDeepLinkUriFactory(
            deepLinkUriPath: deepLinkUri.deepLinkUriPath
        ) else {
            throw DeepLinksError("Could not find DeepLinkHandler for deep link path \(deepLinkUri.deepLinkUriPath)")
        }
        return try deepLinkHandlerFactory.deepLinkHandler(
            deepLinkUri: deepLinkUri,
            deepLinkHandlerBuilderArgsFactory: deepLinkHandlerBuilderArgsFactory
        )
    }
}
