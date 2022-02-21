import DeepLinks

protocol DeepLinkHandlersRegistrarsProvider {
    var deepLinkHandlersRegistrars: [DeepLinkHandlersRegistrar] { get }
}
