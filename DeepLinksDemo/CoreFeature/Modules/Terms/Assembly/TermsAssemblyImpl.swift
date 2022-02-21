final class TermsAssemblyImpl: TermsAssembly {
    func module() -> AssembledModule<TermsModule> {
        let viewController = TermsViewController()
        let presenter = TermsPresenter()
        
        viewController.title = "Terms and conditions"
        
        presenter.view = viewController
        viewController.add(disposable: presenter)
        
        return AssembledModule(interface: presenter, viewController: viewController)
    }
}
