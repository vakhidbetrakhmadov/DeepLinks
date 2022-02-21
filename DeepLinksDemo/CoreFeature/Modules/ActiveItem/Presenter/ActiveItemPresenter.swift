final class ActiveItemPresenter: ActiveItemModule {
    
    weak var view: (AnyObject & ActiveItemView)? {
        didSet {
            guard view !== oldValue else { return }
            didSetView()
        }
    }
    
    var onFinish: ((ActiveItemModule) -> ())?
    
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
