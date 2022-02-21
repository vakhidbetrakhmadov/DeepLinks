public func makeContainer(
    wrapping container: DependencyContainer? = nil)
    -> DependencyContainer
{
    #if TEST
        fatalError()
    #else
        return DependencyContainerImpl(wrapping: container)
    #endif
}
