import DependencyContainer

final class DeepLinkHandlingServiceFactoryImpl: DeepLinkHandlingServiceFactory {
    private let container: DependencyContainer
    private let deepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory
    private let deepLinkHandlerForDeepLinkFactory: DeepLinkHandlerForDeepLinkFactory
    
    init(
        container: DependencyContainer,
        deepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory,
        deepLinkHandlerForDeepLinkFactory: DeepLinkHandlerForDeepLinkFactory)
    {
        self.container = container
        self.deepLinkHandlerForDeepLinkUriFactory = deepLinkHandlerForDeepLinkUriFactory
        self.deepLinkHandlerForDeepLinkFactory = deepLinkHandlerForDeepLinkFactory
    }
    
    func deepLinkHandlingService(dependencies: DeepLinkHandlerDependencies) -> AnyObject & DeepLinkHandlingService {
        let deepLinkHandlerBuilderArgsFactory = DeepLinkHandlerBuilderArgsFactory(
            dependencies: dependencies,
            container: container
        )
        
        return DeepLinkHandlingServiceImpl(
            deepLinkHandlerForDeepLinkUriFactory: deepLinkHandlerForDeepLinkUriFactory,
            deepLinkHandlerForDeepLinkFactory: deepLinkHandlerForDeepLinkFactory,
            deepLinkHandlerBuilderArgsFactory: deepLinkHandlerBuilderArgsFactory
        )
    }
}
