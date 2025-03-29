import UIKit
import SnapKit
import Then

final class ComponentListViewController: UIViewController {
    
    // MARK: - Properties
    
    // 실제 데이터
    private let allComponents: [String] = [
        "UIButton",
        "UILabel",
        "UITextField",
        "UISwitch",
        "UISlider",
        // ... 기타 등등
    ]
    
    // 검색 후 필터링된 데이터
    private var filteredComponents: [String] = []
    
    // 컴포넌트 이름과 연결될 샘플 뷰컨 타입 (예시)
    private let componentViewControllers: [String: UIViewController.Type] = [
        "UIButton": ButtonSampleViewController.self
    ]
    
    // 검색바
    private lazy var searchBar = UISearchBar().then {
        $0.placeholder = "컴포넌트 검색"
        $0.delegate = self
    }
    
    // 테이블뷰
    private lazy var tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        $0.dataSource = self
        $0.delegate = self
        $0.tableFooterView = UIView()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.filteredComponents = self.allComponents  // 초기에는 전체 표시
    }
    
    // MARK: - UI & Layout
    
    private func setupUI() {
        self.title = "My Components"
        self.view.backgroundColor = .systemBackground
        
        // 서브뷰 추가
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
        
        // SnapKit으로 레이아웃
        self.searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource

extension ComponentListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredComponents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let componentName = self.filteredComponents[indexPath.row]
        cell.textLabel?.text = componentName
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ComponentListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let componentName = self.filteredComponents[indexPath.row]
        
        // 등록된 뷰컨 타입을 찾아서 push
        if let vcType = componentViewControllers[componentName] {
            let vc = vcType.init()
            vc.title = componentName
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // 혹시 없는 경우 알림 or 다른 로직 처리
            let alert = UIAlertController(
                title: "준비중",
                message: "\(componentName) 화면은 아직 준비되지 않았습니다.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

// MARK: - UISearchBarDelegate

extension ComponentListViewController: UISearchBarDelegate {
    // 검색바에서 글자가 변경될 때마다
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.filteredComponents = self.allComponents
        } else {
            self.filteredComponents = self.allComponents.filter {
                $0.lowercased().contains(searchText.lowercased())
            }
        }
        self.tableView.reloadData()
    }
    
    // 검색 버튼 클릭 시 키보드 내리기
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
