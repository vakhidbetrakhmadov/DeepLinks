final class DeepLinkHandlersRegistrarProcessorImpl: DeepLinkHandlersRegistrarProcessor {
    private let deepLinkHandlersRegistrarHelper: DeepLinkHandlersRegistrarHelper
    
    init(deepLinkHandlersRegistrarHelper: DeepLinkHandlersRegistrarHelper) {
        self.deepLinkHandlersRegistrarHelper = deepLinkHandlersRegistrarHelper
    }
    
    func process(deepLinkHandlersRegistrar: DeepLinkHandlersRegistrar) {
        deepLinkHandlersRegistrar.registrarDeepLinkHandlers(
            helper: deepLinkHandlersRegistrarHelper
        )
    }
}
