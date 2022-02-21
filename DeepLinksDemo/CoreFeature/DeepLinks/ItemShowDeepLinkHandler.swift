import Core
import DeepLinks
import Foundation

final class ItemShowDeepLinkHandler: DeepLinkHandler {
    private let deepLink: ItemShowDeepLink
    private let itemsService: ItemsService
    private let activeItemOpener: ActiveItemOpener
    private let inactiveItemOpener: InactiveItemOpener
    private let deepLinkHandlingService: DeepLinkHandlingService
    private let messageDisplayable: MessageDisplayable
    private let activityDisplayable: ActivityDisplayable
    private let contentReloadable: ContentReloadable
    private let deepLinkCompletionHandler: DeepLinkCompletionHandler

    init(
        deepLink: ItemShowDeepLink,
        itemsService: ItemsService,
        activeItemOpener: ActiveItemOpener,
        inactiveItemOpener: InactiveItemOpener,
        deepLinkHandlingService: DeepLinkHandlingService,
        messageDisplayable: MessageDisplayable,
        activityDisplayable: ActivityDisplayable,
        contentReloadable: ContentReloadable,
        deepLinkCompletionHandler: DeepLinkCompletionHandler)
    {
        self.deepLink = deepLink
        self.itemsService = itemsService
        self.activeItemOpener = activeItemOpener
        self.inactiveItemOpener = inactiveItemOpener
        self.deepLinkHandlingService = deepLinkHandlingService
        self.messageDisplayable = messageDisplayable
        self.activityDisplayable = activityDisplayable
        self.contentReloadable = contentReloadable
        self.deepLinkCompletionHandler = deepLinkCompletionHandler
    }

    func handle() {
        activityDisplayable.displayActivity()
        itemsService.itemStatus(itemID: deepLink.itemID) { [self] result in
            activityDisplayable.hideActivity()
            
            switch result {
            case .success(let status):
                handleItemStatus(status)
                
            case .failure(let error):
                handleError(error)
            }
        }
    }
    
    private func handleError(_ error: Error) {
        let dismissable = messageDisplayable.display(message: error.localizedDescription)
        dismissable.dismiss(animated: true) { [self] in
            contentReloadable.reloadContent()
        }
    }
    
    private func handleItemStatus(_ itemStatus: ItemStatus) {
        switch itemStatus {
        case .active:
            activeItemOpener.openActiveItem(itemID: deepLink.itemID) { [self] module in
                module.onFinish = { module in
                    module.dismiss(animated: true) {
                        deepLinkCompletionHandler.handleDeepLinkCompletion(deepLink: deepLink, result: .closedActiveItem)
                    }
                }
            }
            
        case .inactive:
            inactiveItemOpener.openInactiveItem(itemID: deepLink.itemID) { [self] module in
                module.onFinish = { module in
                    module.dismiss(animated: true) {
                        deepLinkCompletionHandler.handleDeepLinkCompletion(deepLink: deepLink, result: .closedInactiveItem)
                    }
                }
            }
            
        case .removed(let redirect):
            deepLinkHandlingService.handle(deepLinkUri: redirect)
        }
    }
}
