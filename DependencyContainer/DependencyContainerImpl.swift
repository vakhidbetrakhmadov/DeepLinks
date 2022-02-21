import Core

final class DependencyContainerImpl: DependencyContainer {
    private typealias AnyBuilder = (DependencyContainer) throws -> Any
    
    private var factories: [AnyType: AnyBuilder] = [:]
    private let container: DependencyContainer?
    
    init(wrapping container: DependencyContainer? = nil) {
        self.container = container
    }
    
    func register<T>(builder: @escaping (DependencyContainer) throws -> T) {
        factories[AnyType(T.self)] = { container in
            try builder(container)
        }
    }
    
    func resolve<T>() throws -> T {
        if let value = try factories[AnyType(T.self)]?(self) as? T {
            return value
        }
        
        if let container = container,
           let value: T = try container.resolve()
        {
            return value
        }
        
        throw DependencyContainerError("DependencyContainer failed to resolve \(T.self)")
    }
}
