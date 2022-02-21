import Foundation
import DependencyContainer
import DeepLinks

final class DeepLinkHandlersRegistrar: DeepLinks.DeepLinkHandlersRegistrar {
    func registrarDeepLinkHandlers(helper: DeepLinkHandlersRegistrarHelper) {
        helper.register(
            deepLinkUriPath: "1/item/show",
            deepLinkBuilder: { (queryItems: DeepLinkUriQueryItems) -> ItemShowDeepLink in
                ItemShowDeepLink(
                    itemID: try queryItems.itemValue(for: "itemID")
                )
            },
            deepLinkHandlerBuilder: { (args: DeepLinkHandlerBuilderArgs<ItemShowDeepLink>) -> ItemShowDeepLinkHandler in
                let deepLinkHandlingServiceFactory = args.container.resolveOrFail() as DeepLinkHandlingServiceFactory
                let deepLinkHandlingService = deepLinkHandlingServiceFactory.deepLinkHandlingService(dependencies: args.dependencies)
                
                return ItemShowDeepLinkHandler(
                    deepLink: args.deepLink,
                    itemsService: args.container.resolveOrFail(),
                    activeItemOpener: args.container.resolveOrFail(),
                    inactiveItemOpener: args.container.resolveOrFail(),
                    deepLinkHandlingService: deepLinkHandlingService,
                    messageDisplayable: args.dependencies.messageDisplayable,
                    activityDisplayable: args.dependencies.activityDisplayable,
                    contentReloadable: args.dependencies.contentReloadable,
                    deepLinkCompletionHandler: args.dependencies.deepLinkCompletionHandler
                )
            }
        )
        
        helper.register(
            deepLinkUriPath: "1/terms/show",
            deepLinkBuilder: { (queryItems: DeepLinkUriQueryItems) -> TermsShowDeepLink in
                TermsShowDeepLink()
            },
            deepLinkHandlerBuilder: { (args: DeepLinkHandlerBuilderArgs<TermsShowDeepLink>) -> TermsShowDeepLinkHandler in
                TermsShowDeepLinkHandler(
                    termsOpener: args.container.resolveOrFail()
                )
            }
        )
    }
}
