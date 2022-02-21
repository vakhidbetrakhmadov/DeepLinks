import Core

protocol MainView:
    MessageDisplayable,
    ActivityDisplayable
{
    var onViewDidLoad: (() -> ())? { get set }
    
    func setViewData(_ viewData: MainViewData)
}
