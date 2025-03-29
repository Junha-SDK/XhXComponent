import UIKit

public enum ButtonType: String, CaseIterable {
    case agree
    case auth
    case icon
    case check
    case timer
    case toggle
    case seemore
    case camera
}

public class ButtonTableViewController: BaseDesignSystemListViewController<ButtonType> {
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Button Types"
    }
    
    public override func showDetailViewController(for designSystem: ButtonType) {
        switch designSystem {
        case .agree:
            XHXLogger.verbose("Agree Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .auth:
            XHXLogger.verbose("Auth Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .icon:
            XHXLogger.verbose("Icon Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .check:
            XHXLogger.verbose("Check Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .timer:
            XHXLogger.verbose("Timer Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .toggle:
            XHXLogger.verbose("Toggle Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .seemore:
            XHXLogger.verbose("SeeMore Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .camera:
            XHXLogger.verbose("Camera feature Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        }
    }
}
