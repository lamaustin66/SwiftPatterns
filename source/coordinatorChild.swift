protocol Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = // Instantiate RootViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func login() {
        let vc = // Instantiate LoginViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        let child  = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }

    func signup() {
        let vc = // Instantiate SignUpViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = // Instantiate LoginViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

class RootViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    @IBAction loginTapped(_ sender: Any) {
        coordinator?.login()
    }

    @IBAction signupTapped(_ sender: Any) {
        coordinator?.signup()
    }
}

class LoginViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    weak var coordinator: LoginCoordinator?
}

class SignupViewController: UIViewController {
    weak var coordinator: MainCoordinator?
}
