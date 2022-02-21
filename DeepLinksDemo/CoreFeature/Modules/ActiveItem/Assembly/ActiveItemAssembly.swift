protocol ActiveItemAssembly {
    func module(itemID: String) -> AssembledModule<ActiveItemModule>
}
