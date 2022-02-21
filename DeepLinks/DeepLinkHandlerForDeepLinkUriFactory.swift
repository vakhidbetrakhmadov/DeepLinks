import DependencyContainer

protocol DeepLinkHandlerForDeepLinkUriFactory {
    func deepLinkHandler(
        deepLinkUri: DeepLinkUri,
        deepLinkHandlerBuilderArgsFactory: DeepLinkHandlerBuilderArgsFactory
    ) throws -> DeepLinkHandler
}
