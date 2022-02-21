public protocol ContentReloadable {
    func reloadContent(completion: @escaping() -> ())
}

public extension ContentReloadable {
    func reloadContent() {
        reloadContent(completion: {})
    }
}
