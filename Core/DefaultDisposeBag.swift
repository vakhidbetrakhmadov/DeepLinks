public final class DefaultDisposeBag: DisposeBag {
    private var disposables: Array<AnyObject> = []
    
    public init() {}
    
    public func add(disposable: AnyObject) {
        disposables.append(disposable)
    }
}
