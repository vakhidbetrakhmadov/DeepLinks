import DependencyContainer

public func registerDependencies(in container: DependencyContainer) {
    container.register { () -> DeepLinkHandlersRegistrarsProvider in
        DeepLinkHandlersRegistrarsProviderImpl()
    }
    
    container.register { container -> MainAssembly in
        MainAssemblyImpl(container: container)
    }
    
    container.register { () -> ItemsService in
        ItemsServiceImpl()
    }
    
    container.register { () -> ActiveItemAssembly in
        ActiveItemAssemblyImpl()
    }
    
    container.register { () -> ActiveItemOpener in
        ActiveItemOpenerImpl(
            activeItemAssemby: try container.resolve()
        )
    }
    
    container.register { () -> InactiveItemOpener in
        InactiveItemOpenerImpl(
            inactiveItemAssemby: try container.resolve()
        )
    }
    
    container.register { () -> InactiveItemAssembly in
        InactiveItemAssemblyImpl()
    }
    
    container.register { () -> TermsOpener in
        TermsOpenerImpl(
            termsAssembly: try container.resolve()
        )
    }
    
    container.register { () -> TermsAssembly in
        TermsAssemblyImpl()
    }
}
