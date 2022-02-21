import DependencyContainer

public protocol DeepLinkHandlingServiceFactory {
    func deepLinkHandlingService(dependencies: DeepLinkHandlerDependencies) -> AnyObject & DeepLinkHandlingService
}
