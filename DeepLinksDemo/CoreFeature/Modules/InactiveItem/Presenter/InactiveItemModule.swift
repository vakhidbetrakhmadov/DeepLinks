import Core

protocol InactiveItemModule: AnyObject, Dismissable {
    var onFinish: ((InactiveItemModule) -> ())? { get set }
}
