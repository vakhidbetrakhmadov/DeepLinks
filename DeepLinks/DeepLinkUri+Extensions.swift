public extension DeepLinkUri {
    var deepLinkUriPath: String {
        (host ?? "") + path
    }
}
