import Core

protocol ActiveItemView: Dismissable {
    var onCancelTap: (() -> ())? { get set }
}
