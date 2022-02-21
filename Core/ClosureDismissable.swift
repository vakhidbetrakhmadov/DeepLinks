public final class ClosureDismissable: Dismissable {
    private let dismiss: (_ animated: Bool, _ completion: @escaping () -> ()) -> ()
    
    public init(dismiss: @escaping (_ animated: Bool, _ completion: @escaping () -> ()) -> ()) {
        self.dismiss = dismiss
    }
    
    public func dismiss(animated: Bool, completion: @escaping () -> ()) {
        dismiss(animated, completion)
    }
}
