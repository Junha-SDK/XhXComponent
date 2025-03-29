import UIKit
import SnapKit
import Then

open class BaseDesignSystemListViewController<T: RawRepresentable & CaseIterable>: UIViewController,
                                                                                   UITableViewDataSource,
                                                                                   UITableViewDelegate,
                                                                                   UISearchBarDelegate where T.RawValue == String {
    var allItems: [T] = T.allCases as! [T]
    
    var filteredItems: [T] = []
    
    private lazy var searchBar = UISearchBar().then {
        $0.placeholder = "Search \(T.self)..."
        $0.delegate = self
    }

    private lazy var tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        $0.keyboardDismissMode = .onDrag
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.filteredItems = allItems
        
        self.setupUI()
        self.setupLayout()
        
        XHXLogger.debug("\(Self.self) loaded with \(filteredItems.count) items.")
    }
        
    private func setupUI() {
        self.title = "\(T.self) List"
        self.view.backgroundColor = .white
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
    }
    
    private func setupLayout() {
        // SnapKit
        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
        
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = filteredItems[indexPath.row]
        cell.textLabel?.text = item.rawValue
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = filteredItems[indexPath.row]
        self.showDetailViewController(for: item)
    }
    
    open func showDetailViewController(for designSystem: T) {
        fatalError("Subclasses must override this method.")
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.filteredItems = allItems
        } else {
            let lowerText = searchText.lowercased()
            self.filteredItems = allItems.filter {
                $0.rawValue.lowercased().contains(lowerText)
            }
        }
        self.tableView.reloadData()
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
