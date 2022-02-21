import Core

protocol TermsView: Dismissable {
    var onCancelTap: (() -> ())? { get set }
}
