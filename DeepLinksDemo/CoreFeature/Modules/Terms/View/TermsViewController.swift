import UIKit
import Core

final class TermsViewController:
    BaseViewController,
    TermsView,
    DisposeBagHolder,
    DisposeBag
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelTap))
    }
    
    var onCancelTap: (() -> ())?
    
    let disposeBag: DisposeBag = DefaultDisposeBag()
    
    @objc private func handleCancelTap() {
        onCancelTap?()
    }
}
