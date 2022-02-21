public final class WeakActivityDisplayable: ActivityDisplayable {
    private weak var activityDisplayable: (AnyObject & ActivityDisplayable)?
    
    public init(activityDisplayable: AnyObject & ActivityDisplayable) {
        self.activityDisplayable = activityDisplayable
    }
    
    public func displayActivity() {
        activityDisplayable?.displayActivity()
    }
    
    public func hideActivity() {
        activityDisplayable?.hideActivity()
    }
}
