import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private var viewModel = MainViewModel()
//    private let router: Router
    private lazy var tableViewDelegate = MainTableViewDelegate(viewModel: viewModel, navigationController: self.navigationController!)
    private lazy var tableViewDataSource = MainTableViewDataSource(viewModel: viewModel)
    
    private lazy var mainTableView = UITableView().apply {
        $0.dataSource = tableViewDataSource
        $0.delegate = tableViewDelegate
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        
        viewModel.fetchMovie { [weak self] in
            DispatchQueue.main.async {
                self?.tableViewDataSource.sections = self?.viewModel.getAllMovieResults() ?? []
                self?.tableViewDelegate.sections = self?.viewModel.getAllMovieResults() ?? []
                self?.mainTableView.reloadData()
            }
        }
    }
}

private extension MainViewController {
    func setupViews() {
        view.addSubview(mainTableView)
    }
    
    func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
