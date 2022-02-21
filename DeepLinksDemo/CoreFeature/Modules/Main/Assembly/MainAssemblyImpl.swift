import UIKit
import Core
import DependencyContainer
import DeepLinks

final class MainAssemblyImpl: MainAssembly {
    
    private let container: DependencyContainer
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    func module() -> AssembledModule<MainModule> {
        let viewController = MainViewController()
        
        let interactor = MainInteractorImpl(
            itemsService: container.resolveOrFail()
        )
        
        let weakMessageDisplayable = WeakMessageDisplayable(messageDisplayable: viewController)
        let weakActivityDisplayable = WeakActivityDisplayable(activityDisplayable: viewController)
        
        let presenter = MainPresenter(
            interactor: interactor,
            messageDisplayable: weakMessageDisplayable,
            activityDisplayable: weakActivityDisplayable
        )
        
        let weakContentReloadable = WeakContentReloadable(contentReloadable: presenter)
        let weakDeepLinkCompletionHandler = WeakDeepLinkCompletionHandler(deepLinkCompletionHandler: presenter)
        
        let deepLinkHandlerDependencies = DeepLinkHandlerDependencies(
            messageDisplayable: weakMessageDisplayable,
            activityDisplayable: weakActivityDisplayable,
            contentReloadable: weakContentReloadable,
            deepLinkCompletionHandler: weakDeepLinkCompletionHandler
        )
        let deepLinkHandlingServiceFactory = container.resolveOrFail() as DeepLinkHandlingServiceFactory
        let deepLinkHandlingService = deepLinkHandlingServiceFactory.deepLinkHandlingService(dependencies: deepLinkHandlerDependencies)
        
        presenter.view = viewController
        presenter.deepLinkHandlingService = deepLinkHandlingService
        
        viewController.add(disposable: presenter)
        
        return AssembledModule(interface: presenter, viewController: viewController)
    }
}
