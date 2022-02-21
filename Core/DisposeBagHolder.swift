public protocol DisposeBagHolder {
    var disposeBag: DisposeBag { get }
}

public extension DisposeBagHolder where Self: DisposeBag {
    func add(disposable: AnyObject) {
        disposeBag.add(disposable: disposable)
    }
}
