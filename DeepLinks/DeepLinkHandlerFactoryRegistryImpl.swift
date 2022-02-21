import Core
import DependencyContainer

final class DeepLinkHandlerFactoryRegistryImpl:
    DeepLinkHandlerFactoryRegistry
{
    private var deepLinkHandlerFactoryByDeepLinkUriPath: [DeepLinkUriPath: DeepLinkHandlerForDeepLinkUriFactory] = [:]
    private var deepLinkHandlerFactoryByDeepLinkType: [AnyType: DeepLinkHandlerForDeepLinkFactory] = [:]
    
    func deepLinkHandlerForDeepLinkUriFactory(
        deepLinkUriPath: DeepLinkUriPath
    ) -> DeepLinkHandlerForDeepLinkUriFactory? {
        deepLinkHandlerFactoryByDeepLinkUriPath[deepLinkUriPath]
    }
    
    func deepLinkHandlerForDeepLinkFactory<T: DeepLink>(
        deepLinkType: T.Type
    ) -> DeepLinkHandlerForDeepLinkFactory? {
        deepLinkHandlerFactoryByDeepLinkType[AnyType(deepLinkType.self)]
    }
    
    func register(
        deepLinkUriPath: DeepLinkUriPath,
        deepLinkHandlerForDeepLinkUriFactory: DeepLinkHandlerForDeepLinkUriFactory)
    {
        deepLinkHandlerFactoryByDeepLinkUriPath[deepLinkUriPath] = deepLinkHandlerForDeepLinkUriFactory
    }
    
    func register<T: DeepLink>(
        deepLinkType: T.Type,
        deepLinkHandlerForDeepLinkFactory: DeepLinkHandlerForDeepLinkFactory)
    {
        deepLinkHandlerFactoryByDeepLinkType[AnyType(deepLinkType.self)] = deepLinkHandlerForDeepLinkFactory
    }
}
