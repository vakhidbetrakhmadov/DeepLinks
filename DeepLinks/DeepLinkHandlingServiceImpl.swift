import DependencyContainer

final class DeepLinkHandlingServiceImpl: DeepLinkHandlingService {
    private let deepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory
    private let deepLinkHandlerForDeepLinkFactory: DeepLinkHandlerForDeepLinkFactory
    private let deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    
    init(
        deepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory,
        deepLinkHandlerForDeepLinkFactory: DeepLinkHandlerForDeepLinkFactory,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory)
    {
        self.deepLinkHandlerForDeepLinkUriFactory = deepLinkHandlerForDeepLinkUriFactory
        self.deepLinkHandlerForDeepLinkFactory = deepLinkHandlerForDeepLinkFactory
        self.deepLinkHandlerBuilderArgsFactory = deepLinkHandlerBuilderArgsFactory
    }
    
    func handle(deepLinkUri: DeepLinkUri) {
        do {
            let deepLinkHandler = try deepLinkHandlerForDeepLinkUriFactory.deepLinkHandler(
                deepLinkUri: deepLinkUri,
                deepLinkHandlerBuilderArgsFactory: deepLinkHandlerBuilderArgsFactory
            )
            deepLinkHandler.handle()
        } catch {
            assertionFailure("""
                Failed to handle \(deepLinkUri)
                \(error.localizedDescription)
                """
            )
        }
    }
    
    func handle<T: DeepLink>(deepLink: T) {
        do {
            let deepLinkHandler = try deepLinkHandlerForDeepLinkFactory.deepLinkHandler(
                deepLink: deepLink,
                deepLinkHandlerBuilderArgsFactory: deepLinkHandlerBuilderArgsFactory
            )
            deepLinkHandler.handle()
        } catch {
            assertionFailure("""
                Failed to handle \(deepLink)
                \(error.localizedDescription)
                """
            )
        }
    }
}
