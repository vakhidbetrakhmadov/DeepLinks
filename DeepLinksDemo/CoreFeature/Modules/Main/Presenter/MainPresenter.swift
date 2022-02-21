import Foundation
import Core
import DeepLinks

final class MainPresenter:
    MainModule,
    DeepLinkCompletionHandler,
    ContentReloadable
{
    private let interactor: MainInteractor
    private let messageDisplayable: MessageDisplayable
    private let activityDisplayable: ActivityDisplayable
    
    init(
        interactor: MainInteractor,
        messageDisplayable: MessageDisplayable,
        activityDisplayable: ActivityDisplayable)
    {
        self.interactor = interactor
        self.messageDisplayable = messageDisplayable
        self.activityDisplayable = activityDisplayable
    }
    
    var deepLinkHandlingService: DeepLinkHandlingService?
    
    weak var view: (AnyObject & MainView)? {
        didSet {
            guard view !== oldValue else { return }
            didSetView()
        }
    }
    
    func handleDeepLinkCompletion(args: DeepLinkCompletionArgs) {
        if let (deepLink, result) = args.on(ItemShowDeepLink.self) {
            messageDisplayable.display(message: "Did finish handling \(deepLink) with result \(result)")
        }
    }
    
    func reloadContent(completion: @escaping () -> ()) {
        loadItemsAndUpdateView(completion: completion)
    }
    
    private func didSetView() {
        view?.onViewDidLoad = { [weak self] in
            self?.loadItemsAndUpdateView()
        }
    }
    
    private func loadItemsAndUpdateView(completion: @escaping () -> () = {}) {
        activityDisplayable.displayActivity()
        interactor.loadItems { [weak self] error in
            self?.activityDisplayable.hideActivity()
            if let error = error {
                self?.display(error: error)
            } else {
                self?.updateView()
            }
        }
    }
    
    private func updateView() {
        view?.setViewData(viewData())
    }
    
    private func viewData() -> MainViewData {
        MainViewData(
            itemTitles: interactor.items.map(\.title),
            onItemTap: { [weak self] index in
                guard let self = self else { return }
                let item = self.interactor.items[index]
                self.deepLinkHandlingService?.handle(deepLinkUri: item.deepLinkUri)
            }
        )
    }
    
    private func display(error: Error) {
        messageDisplayable.display(message: error.localizedDescription)
    }
}
