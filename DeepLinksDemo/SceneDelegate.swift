import DependencyContainer
import DeepLinks
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        setUp()
        
        window = window ?? UIWindow()
        window?.windowScene = scene
        window?.makeKeyAndVisible()
        
        let mainModule = mainAssembly().module()
        window?.rootViewController = UINavigationController(rootViewController: mainModule.viewController)
    }
    
    private func mainAssembly() -> MainAssembly {
        container.resolveOrFail() as MainAssembly
    }
    
    private func setUp() {
        registerDependencies(in: container)
        processDeepLinkHandlersRegistrars()
    }
    
    private func registerDependencies(in container: DependencyContainer) {
        DeepLinksDemo.registerDependencies(in: container)
        DeepLinks.registerDependencies(in: container)
    }
    
    private func processDeepLinkHandlersRegistrars() {
        let deepLinkHandlersRegistrarProcessor = container.resolveOrFail() as DeepLinkHandlersRegistrarProcessor
        let deepLinkHandlersRegistrarsProvider = container.resolveOrFail() as DeepLinkHandlersRegistrarsProvider
        
        deepLinkHandlersRegistrarsProvider
            .deepLinkHandlersRegistrars
            .forEach {
                deepLinkHandlersRegistrarProcessor.process(deepLinkHandlersRegistrar: $0)
            }
    }
    
    private let container = makeContainer()
}
