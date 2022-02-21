final class TermsOpenerImpl: BaseOpener, TermsOpener {
    private let termsAssembly: TermsAssembly
    
    init(termsAssembly: TermsAssembly) {
        self.termsAssembly = termsAssembly
    }
    
    func openTerms(configure: (TermsModule) -> ()) {
        pushViewControllerDerivedFrom {
            let inactiveItemModule = termsAssembly.module()
            configure(inactiveItemModule.interface)
            return inactiveItemModule.viewController
        }
    }
}
