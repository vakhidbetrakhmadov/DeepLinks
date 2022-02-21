protocol InactiveItemAssembly {
    func module(itemID: String) -> AssembledModule<InactiveItemModule>
}
