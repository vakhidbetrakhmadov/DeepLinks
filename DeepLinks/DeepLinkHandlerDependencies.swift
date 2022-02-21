import Core

public final class DeepLinkHandlerDependencies {
    public let messageDisplayable: MessageDisplayable
    public let activityDisplayable: ActivityDisplayable
    public let contentReloadable: ContentReloadable
    public let deepLinkCompletionHandler: DeepLinkCompletionHandler
    
    public init(
        messageDisplayable: MessageDisplayable,
        activityDisplayable: ActivityDisplayable,
        contentReloadable: ContentReloadable,
        deepLinkCompletionHandler: DeepLinkCompletionHandler)
    {
        self.messageDisplayable = messageDisplayable
        self.activityDisplayable = activityDisplayable
        self.contentReloadable = contentReloadable
        self.deepLinkCompletionHandler = deepLinkCompletionHandler
    }
}
