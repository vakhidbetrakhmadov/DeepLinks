final class InactiveItemPresenter: InactiveItemModule {
    
    weak var view: (AnyObject & InactiveItemView)? {
        didSet {
            guard view !== oldValue else { return }
            didSetView()
        }
    }
    
    var onFinish: ((InactiveItemModule) -> ())?
    
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
