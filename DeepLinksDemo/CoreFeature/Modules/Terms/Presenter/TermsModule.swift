import Core

protocol TermsModule: AnyObject, Dismissable {
    var onFinish: ((TermsModule) -> ())? { get set }
}
