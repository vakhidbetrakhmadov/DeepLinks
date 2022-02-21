import Core

protocol InactiveItemView: Dismissable {
    var onCancelTap: (() -> ())? { get set }
}
