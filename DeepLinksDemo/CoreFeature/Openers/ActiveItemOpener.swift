protocol ActiveItemOpener {
    func openActiveItem(itemID: String, configure: (ActiveItemModule) -> ())
}
