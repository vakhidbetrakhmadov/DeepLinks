final class TermsPresenter: TermsModule {
    
    weak var view: (AnyObject & TermsView)? {
        didSet {
            guard view !== oldValue else { return }
            didSetView()
        }
    }
    
    var onFinish: ((TermsModule) -> ())?
    
    func dismiss(animated: Bool, completion: @escaping () -> ()) {
        view?.dismiss(animated: animated, completion: completion)
    }
    
    private func didSetView() {
        view?.onCancelTap = { [weak self] in
            self?.finish()
        }
    }
    
    private func finish() {
        onFinish?(self)
    }
}
