import Foundation
import DependencyContainer

public protocol DeepLinkHandlersRegistrarHelper {
    func register<T: DeepLink, D: DeepLinkHandler>(
        deepLinkUriPath: DeepLinkUriPath,
        deepLinkBuilder: @escaping (DeepLinkUriQueryItems) throws -> T,
        deepLinkHandlerBuilder: @escaping (DeepLinkHandlerBuilderArgs<T>) throws -> D
    )
}
