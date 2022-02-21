import DeepLinks

final class TermsShowDeepLinkHandler: DeepLinkHandler {
    private let termsOpener: TermsOpener
    
    init(termsOpener: TermsOpener) {
        self.termsOpener = termsOpener
    }
    
    func handle() {
        termsOpener.openTerms { module in
            module.onFinish = { module in
                module.dismiss(animated: true)
            }
        }
    }
}
