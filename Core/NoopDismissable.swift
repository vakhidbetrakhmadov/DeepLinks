struct NoopDismissable: Dismissable {
    func dismiss(animated: Bool, completion: @escaping () -> ()) { }
}
