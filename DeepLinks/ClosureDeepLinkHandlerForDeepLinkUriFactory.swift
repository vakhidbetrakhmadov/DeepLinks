import DependencyContainer

final class ClosureDeepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory {
    private let deepLinkHandler: (DeepLinkUri, DeepLinkHandlerBuilderArgsFactory) throws -> DeepLinkHandler
    
    init(deepLinkHandler: @escaping (DeepLinkUri, DeepLinkHandlerBuilderArgsFactory) throws -> DeepLinkHandler) {
        self.deepLinkHandler = deepLinkHandler
    }
    
    func deepLinkHandler(
        deepLinkUri: DeepLinkUri,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    ) throws -> DeepLinkHandler {
        try deepLinkHandler(deepLinkUri, deepLinkHandlerBuilderArgsFactory)
    }
}
