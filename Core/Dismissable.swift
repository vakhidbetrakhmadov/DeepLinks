public protocol Dismissable {
    func dismiss(animated: Bool, completion: @escaping () -> ())
}

public extension Dismissable {
    func dismiss(animated: Bool) {
        dismiss(animated: animated, completion: {})
    }
}
