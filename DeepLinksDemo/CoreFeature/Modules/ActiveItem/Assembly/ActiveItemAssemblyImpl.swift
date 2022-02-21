final class ActiveItemAssemblyImpl: ActiveItemAssembly {
    func module(itemID: String) -> AssembledModule<ActiveItemModule> {
        let viewController = ActiveItemViewController()
        let presenter = ActiveItemPresenter()
        
        viewController.title = "Active item \(itemID)"
        
        presenter.view = viewController
        viewController.add(disposable: presenter)
        
        return AssembledModule(interface: presenter, viewController: viewController)
    }
}
