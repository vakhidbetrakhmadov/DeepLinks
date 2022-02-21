public protocol MessageDisplayable {
    @discardableResult
    func display(message: String) -> Dismissable
}
