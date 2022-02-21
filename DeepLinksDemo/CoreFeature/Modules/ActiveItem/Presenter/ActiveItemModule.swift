import Core

protocol ActiveItemModule: AnyObject, Dismissable {
    var onFinish: ((ActiveItemModule) -> ())? { get set }
}
