final class InactiveItemOpenerImpl: BaseOpener, InactiveItemOpener {
    private let inactiveItemAssemby: InactiveItemAssembly
    
    init(inactiveItemAssemby: InactiveItemAssembly) {
        self.inactiveItemAssemby = inactiveItemAssemby
    }
    
    func openInactiveItem(itemID: String, configure: (InactiveItemModule) -> ()) {
        pushViewControllerDerivedFrom {
            let inactiveItemModule = inactiveItemAssemby.module(itemID: itemID)
            configure(inactiveItemModule.interface)
            return inactiveItemModule.viewController
        }
    }
}
