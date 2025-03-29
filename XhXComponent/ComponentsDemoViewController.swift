import UIKit

public enum DesignSystemType: String, CaseIterable {
    case button
    case textField
    case label
    case line
    case profile
    case alert
    case bottomSheet
    case emptyView
    case pagingTabBar
    case banner
    case slider
    case horizontalPicker
    case dropDown
}

public class ComponentsDemoViewController: BaseDesignSystemListViewController<DesignSystemType> {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Design Systems"
    }
    
    public override func showDetailViewController(for designSystem: DesignSystemType) {
        switch designSystem {
        case .button:
            XHXLogger.verbose("Button")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .textField:
            XHXLogger.verbose("textField")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .label:
            XHXLogger.verbose("label")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .line:
            XHXLogger.verbose("line")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .profile:
            XHXLogger.verbose("profile")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .alert:
            XHXLogger.verbose("alert")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .bottomSheet:
            XHXLogger.verbose("bottomSheet")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .emptyView:
            XHXLogger.verbose("emptyView")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .pagingTabBar:
            XHXLogger.verbose("pagingTabBar")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .banner:
            XHXLogger.verbose("Banner")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .slider:
            XHXLogger.verbose("Slider")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .horizontalPicker:
            XHXLogger.verbose("horizontalPicker")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        case .dropDown:
            XHXLogger.verbose("dropDown")
            self.navigationController?.pushVC(ButtonTableViewController.self)
        }
    }
}
