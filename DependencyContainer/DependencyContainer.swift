public protocol DependencyContainer {
    func register<T>(builder: @escaping (DependencyContainer) throws -> T)
    func resolve<T>() throws -> T
}

public extension DependencyContainer {
    func register<T>(builder: @escaping () throws -> T) {
        register { _ in try builder() }
    }
    
    func resolveOrFail<T>() -> T {
        do {
            return try resolve()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
