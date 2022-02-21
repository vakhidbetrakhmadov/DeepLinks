import UIKit
import Core

class BaseViewController: UIViewController, Dismissable {
    // super basic simulation of Marshroute (https://github.com/avito-tech/Marshroute)
    func dismiss(animated: Bool, completion: @escaping () -> ()) {
        if let navigationController = navigationController, navigationController.viewControllers.first === self {
            navigationController.dismiss(animated: animated, completion: completion)
        } else if let navigationController = navigationController {
             CATransaction.begin()
             CATransaction.setCompletionBlock(completion)
             navigationController.popViewController(animated: animated)
             CATransaction.commit()
         } else {
            dismiss(animated: animated, completion: completion)
        }
    }
}
