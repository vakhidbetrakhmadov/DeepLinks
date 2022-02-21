protocol InactiveItemOpener {
    func openInactiveItem(itemID: String, configure: (InactiveItemModule) -> ())
}
