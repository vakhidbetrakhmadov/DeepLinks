import DependencyContainer

public struct DeepLinkHandlerBuilderArgs<T: DeepLink> {
    public let deepLink: T
    public let container: DependencyContainer
    public let dependencies: DeepLinkHandlerDependencies
}
