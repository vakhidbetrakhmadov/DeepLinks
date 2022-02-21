protocol DeepLinkHandlerFactoryRegistry {
    func deepLinkHandlerForDeepLinkUriFactory(
        deepLinkUriPath: DeepLinkUriPath
    ) -> DeepLinkHandlerForDeepLinkUriFactory?
    
    func deepLinkHandlerForDeepLinkFactory<T: DeepLink>(
        deepLinkType: T.Type
    ) -> DeepLinkHandlerForDeepLinkFactory?
    
    func register(
        deepLinkUriPath: DeepLinkUriPath,
        deepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory
    )
    
    func register<T: DeepLink>(
        deepLinkType: T.Type,
        deepLinkHandlerForDeepLinkFactory: DeepLinkHandlerForDeepLinkFactory
    )
}
