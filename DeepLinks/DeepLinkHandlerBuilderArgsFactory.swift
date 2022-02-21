import DependencyContainer

final class DeepLinkHandlerBuilderArgsFactory {
    private let dependencies: DeepLinkHandlerDependencies
    private let container: DependencyContainer
    
    init(dependencies: DeepLinkHandlerDependencies, container: DependencyContainer) {
        self.dependencies = dependencies
        self.container = container
    }
    
    func deepLinkHandlerBuilderArgs<T: DeepLink>(deepLink: T) -> DeepLinkHandlerBuilderArgs<T> {
        DeepLinkHandlerBuilderArgs(
            deepLink: deepLink,
            container: container,
            dependencies: dependencies
        )
    }
}
