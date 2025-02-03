import UIKit
import Presentation
import Swinject
import RxFlow
import Core
import Flow
import Data

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            let code = url.absoluteString.components(separatedBy: "code=").last ?? ""
            LoginManager.shared.requestAccessToken(with: code)
        }
    }
    private var coordinator = FlowCoordinator()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window = UIWindow(windowScene: windowScene)
        let appFlow = AppFlow(window: window, container: AppDelegate.container)
        coordinator.coordinate(
            flow: appFlow,
            with: AppStepper(),
            allowStepWhenDismissed: false
        )
        window.makeKeyAndVisible()
    }
}
func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
