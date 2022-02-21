import DependencyContainer

final class DeepLinkHandlersRegistrarHelperImpl: DeepLinkHandlersRegistrarHelper {
    private let deepLinkHandlerFactoryRegistry: DeepLinkHandlerFactoryRegistry
    
    init(deepLinkHandlerFactoryRegistry: DeepLinkHandlerFactoryRegistry) {
        self.deepLinkHandlerFactoryRegistry = deepLinkHandlerFactoryRegistry
    }
    
    func register<
        T: DeepLink,
        D: DeepLinkHandler>
    (
        deepLinkUriPath: DeepLinkUriPath,
        deepLinkBuilder: @escaping (DeepLinkUriQueryItems) throws -> T,
        deepLinkHandlerBuilder: @escaping (DeepLinkHandlerBuilderArgs<T>) throws -> D)
    {
        let deepLinkHandlerForDeepLinkUriFactory = ClosureDeepLinkHandlerForDeepLinkUriFactory { deepLinkUri, deepLinkHandlerBuilderArgsFactory in
            let deepLink = try deepLinkBuilder(deepLinkUri.queryItems ?? [])
            let deepLinkHandlerBuilderArgs = deepLinkHandlerBuilderArgsFactory.deepLinkHandlerBuilderArgs(deepLink: deepLink)
            return try deepLinkHandlerBuilder(deepLinkHandlerBuilderArgs)
        }
        
        deepLinkHandlerFactoryRegistry.register(
            deepLinkUriPath: deepLinkUriPath,
            deepLinkHandlerForDeepLinkUriFactory: deepLinkHandlerForDeepLinkUriFactory
        )
        
        let deepLinkHandlerForDeepLinkFactory = ClosureDeepLinkHandlerForDeepLinkFactory<T> { deepLink, deepLinkHandlerBuilderArgsFactory in
            let deepLinkHandlerBuilderArgs = deepLinkHandlerBuilderArgsFactory.deepLinkHandlerBuilderArgs(deepLink: deepLink)
            return try deepLinkHandlerBuilder(deepLinkHandlerBuilderArgs)
        }
        
        deepLinkHandlerFactoryRegistry.register(
            deepLinkType: T.self,
            deepLinkHandlerForDeepLinkFactory: deepLinkHandlerForDeepLinkFactory
        )
    }
}
