import UIKit
import DependencyContainer

protocol MainAssembly {
    func module() -> AssembledModule<MainModule>
}
