import DeepLinks

struct ItemShowDeepLink: DeepLink {
    let itemID: String
}

extension ItemShowDeepLink {
    enum Result {
        case closedActiveItem
        case closedInactiveItem
    }
}
