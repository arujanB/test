//
//  MainTableViewCell.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 18.10.2024.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    static let identifier = "MainTableViewCell"
    
    private var title = UILabel().apply {
//        $0.textColor = .red
        $0.font = UIFont.boldSystemFont(ofSize: 16)
//        $0.backgroundColor = .yellow
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        self.title.text = title
    }
}

private extension MainTableViewCell {
    func setupViews() {
        contentView.addSubview(title)
    }
    
    func setupConstaints() {
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
