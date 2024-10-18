//
//  DetailViewController.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 18.10.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    private lazy var titleLabel = UILabel().apply {
        $0.textAlignment = .center
        $0.text = resultDate.title
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }

    var resultDate: MovieResult
    private var viewModel = DetailViewModel()
    
    init(resultDate: MovieResult) {
        self.resultDate = resultDate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(resultDate.title)
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        print("ARUZHAN \(resultDate.imdb_id)")
        viewModel.fetchRequestMovieById(id: resultDate.imdb_id) { _ in
            if let movieDetail = self.viewModel.getMovieDetail() {
                print("Fetched movie title: \(movieDetail.title)")
            } else {
                print("Failed to fetch movie details.")
            }
        }

    }
}

private extension DetailViewController {
    func setupViews() {
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
