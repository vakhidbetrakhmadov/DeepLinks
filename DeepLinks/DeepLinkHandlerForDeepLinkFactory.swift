import DependencyContainer

protocol DeepLinkHandlerForDeepLinkFactory {
    func deepLinkHandler<T: DeepLink>(
        deepLink: T,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    ) throws -> DeepLinkHandler
}
