import UIKit

class BaseOpener {
    // super basic simulation of Marshroute (https://github.com/avito-tech/Marshroute)
    func pushViewControllerDerivedFrom(deriveViewController: () -> UIViewController) {
        guard let rootViewController = rootViewController() as? UINavigationController else { return }
        rootViewController.pushViewController(deriveViewController(), animated: true)
    }
    
    func presentModalViewControllerDerivedFrom(deriveViewController: () -> UIViewController) {
        guard let rootViewController = rootViewController() else { return }
        rootViewController.present(deriveViewController(), animated: true, completion: nil)
    }
    
    private func rootViewController() -> UIViewController? {
        guard let windowSceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? UIWindowSceneDelegate else { return nil }
        guard let rootViewController = windowSceneDelegate.window??.rootViewController as? UINavigationController else { return nil }
        return rootViewController
    }
}
