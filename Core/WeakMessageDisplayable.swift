public final class WeakMessageDisplayable: MessageDisplayable {
    private weak var messageDisplayable: (MessageDisplayable & AnyObject)?
    
    public init(messageDisplayable: MessageDisplayable & AnyObject) {
        self.messageDisplayable = messageDisplayable
    }
    
    public func display(message: String) -> Dismissable {
        messageDisplayable?.display(message: message) ?? NoopDismissable()
    }
}
