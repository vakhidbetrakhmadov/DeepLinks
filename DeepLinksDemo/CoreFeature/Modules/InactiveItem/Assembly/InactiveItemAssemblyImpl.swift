final class InactiveItemAssemblyImpl: InactiveItemAssembly {
    func module(itemID: String) -> AssembledModule<InactiveItemModule> {
        let viewController = InactiveItemViewController()
        let presenter = InactiveItemPresenter()
        
        viewController.title = "Inactive item \(itemID)"
        
        presenter.view = viewController
        viewController.add(disposable: presenter)
        
        return AssembledModule(interface: presenter, viewController: viewController)
    }
}
