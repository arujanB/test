//import Foundation
//import Factory
//import Infra
//import Convenience
//
//typealias AppContainer = Container
//typealias Dependency = Factory
//typealias ParametrizedDependency = ParameterFactory
//
//extension AppContainer: AutoRegistering {
//    public func autoRegister() {
//        /// Makes all of the registrations in scope `.singleton` by default
//        manager.defaultScope = .singleton
//    }
//}
//
//extension AppContainer {
//    var userRepository: Dependency<UserRepository> {
//        self {
//            UserRepository()
//        }
//    }
//    
//    var appCoordinator: Dependency<AppCoordinator> {
//        self {
//            AppCoordinator(router: .init(navigationController: .init()))
//        }
//    }
//}
//
//struct UserProfile {
//    let name: String
//}
//
//final class UserRepository {
//    private var inMemoryUserProfile = UserProfile(name: "Default")
//    
//    func updateUserProfile(_ userProfile: UserProfile) async {
////        await delay(seconds: 1.5)
//        inMemoryUserProfile = userProfile
//    }
//    
//    func fetchUserProfile() async -> UserProfile {
////        await delay(seconds: 1.5)
//        return inMemoryUserProfile
//    }
//}
//
//class AppCoordinator: Coordinator {
//    @Injected(\Env.userStorage) private var userStorage
//    @Injected(\UseCases.getUserFlowUseCase) var getUserFlowUseCase
//
//    override func start() {
////        let flow = getUserFlowUseCase.execute()
////        switch flow {
////        case .auth:
////            break
////        case .main:
//            runMainFlow()
////        }
//    }
//    
//    private func runMainFlow() {
//        let coordinator = MainCoordinator(router: router, delegate: self)
//        addDependency(coordinator)
//        coordinator.start()
//    }
//}
//
////MARK: -MainTabBarCoordinatorDelegate
//
//extension AppCoordinator: MainCoordinatorDelegate {
//    func didFinish(_ coordinator: MainCoordinator) {
//        removeDependency(coordinator)
////        logout()
//    }
//}
//
