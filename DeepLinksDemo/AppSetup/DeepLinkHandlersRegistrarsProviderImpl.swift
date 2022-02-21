import DeepLinks

final class DeepLinkHandlersRegistrarsProviderImpl: DeepLinkHandlersRegistrarsProvider {
    let deepLinkHandlersRegistrars: [DeepLinkHandlersRegistrar] = [
        DeepLinkHandlersRegistrar()
    ]
}
