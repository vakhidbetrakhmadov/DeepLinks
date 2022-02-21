import UIKit
import Core
import DeepLinks
import DependencyContainer

class MainViewController:
    UIViewController,
    MainView,
    DisposeBagHolder,
    DisposeBag
{
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .systemBlue
        return activity
    }()
    
    private lazy var itemsStack: UIStackView = {
        let itemsStack = UIStackView()
        itemsStack.axis = .vertical
        itemsStack.alignment = .fill
        itemsStack.distribution = .fillEqually
        itemsStack.spacing = 32
        return itemsStack
    }()
    
    private var onItemTap: ((_ index: Int) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(itemsStack)
        itemsStack.translatesAutoresizingMaskIntoConstraints = false
        itemsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: +32).isActive = true
        itemsStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        itemsStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: +32).isActive = true
        itemsStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        
        view.addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        onViewDidLoad?()
    }
    
    var onViewDidLoad: (() -> ())?
    
    func setViewData(_ viewData: MainViewData) {
        itemsStack.subviews.forEach(itemsStack.removeArrangedSubview)
        itemsStack.subviews.forEach { $0.removeFromSuperview() }
        
        viewData.itemTitles.forEach { title in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(handleItemTap), for: .touchUpInside)
            button.backgroundColor = .systemRed
            button.layer.cornerRadius = 6
            itemsStack.addArrangedSubview(button)
        }
        
        onItemTap = viewData.onItemTap
    }
    
    func display(message: String) -> Dismissable {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        return ClosureDismissable { [weak alert] animated, completion in
            alert?.dismiss(animated: animated, completion: completion)
        }
    }
    
    func displayActivity() {
        activity.startAnimating()
    }
    
    func hideActivity() {
        activity.stopAnimating()
    }
    
    let disposeBag: DisposeBag = DefaultDisposeBag()
    
    @objc private func handleItemTap(button: UIButton) {
        guard let index = itemsStack.subviews.firstIndex(where: { $0 === button }) else { return }
        onItemTap?(index)
    }
}
