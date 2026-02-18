import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {

    override func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            if let vc = windowScene.windows.first?.rootViewController as? FlutterViewController {
                TryKmpHostApiSetup.setUp(
                    binaryMessenger: vc.binaryMessenger,
                    api: TryKmpHost()
                )
            }
        }
    }
}
