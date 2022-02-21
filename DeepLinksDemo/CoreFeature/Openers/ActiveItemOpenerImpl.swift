final class ActiveItemOpenerImpl: BaseOpener, ActiveItemOpener {
    private let activeItemAssemby: ActiveItemAssembly
    
    init(activeItemAssemby: ActiveItemAssembly) {
        self.activeItemAssemby = activeItemAssemby
    }
    
    func openActiveItem(itemID: String, configure: (ActiveItemModule) -> ()) {
        pushViewControllerDerivedFrom {
            let activeItemModule = activeItemAssemby.module(itemID: itemID)
            configure(activeItemModule.interface)
            return activeItemModule.viewController
        }
    }
}
