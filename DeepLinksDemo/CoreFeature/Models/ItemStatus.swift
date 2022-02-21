import DeepLinks

enum ItemStatus {
    case active
    case inactive
    case removed(redirect: DeepLinkUri)
}
