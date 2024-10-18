import UIKit

final class MainTableViewDelegate: NSObject, UITableViewDelegate {
    var sections: [MovieResult] = []
    private let viewModel: MainViewModel
    private weak var navigationController: UINavigationController?

    init(viewModel: MainViewModel, navigationController: UINavigationController) {
        self.viewModel = viewModel
        self.navigationController = navigationController
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieResult = sections[indexPath.row]
        let detailVC = DetailViewController(resultDate: movieResult)
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
