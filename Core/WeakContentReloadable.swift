public final class WeakContentReloadable: ContentReloadable {
    private let contentReloadable: (AnyObject & ContentReloadable)?
    
    public init(contentReloadable: AnyObject & ContentReloadable) {
        self.contentReloadable = contentReloadable
    }
    
    public func reloadContent(completion: @escaping () -> ()) {
        contentReloadable?.reloadContent(completion: completion)
    }
}
