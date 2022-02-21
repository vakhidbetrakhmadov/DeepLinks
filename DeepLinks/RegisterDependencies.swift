import DependencyContainer

public func registerDependencies(in container: DependencyContainer) {
    container.register { [deepLinkHandlerFactoryRegistry = DeepLinkHandlerFactoryRegistryImpl()]
        () -> DeepLinkHandlerFactoryRegistry in
        deepLinkHandlerFactoryRegistry
    }
    
    container.register { () -> DeepLinkHandlerForDeepLinkUriFactory in
        DeepLinkHandlerForDeepLinkUriFactoryImpl(
            deepLinkHandlerFactoryRegistry: try container.resolve()
        )
    }
    
    container.register { () -> DeepLinkHandlerForDeepLinkFactory in
        DeepLinkHandlerForDeepLinkFactoryImpl(
            deepLinkHandlerFactoryRegistry: try container.resolve()
        )
    }
    
    container.register { container -> DeepLinkHandlersRegistrarHelper in
        DeepLinkHandlersRegistrarHelperImpl(
            deepLinkHandlerFactoryRegistry: try container.resolve()
        )
    }
    
    container.register { container -> DeepLinkHandlingServiceFactory in
        DeepLinkHandlingServiceFactoryImpl(
            container: container,
            deepLinkHandlerForDeepLinkUriFactory: try container.resolve(),
            deepLinkHandlerForDeepLinkFactory: try container.resolve()
        )
    }
    
    container.register { container -> DeepLinkHandlersRegistrarProcessor in
        DeepLinkHandlersRegistrarProcessorImpl(
            deepLinkHandlersRegistrarHelper: try container.resolve()
        )
    }
}
