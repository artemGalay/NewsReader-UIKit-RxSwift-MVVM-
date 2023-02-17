//
//  HeadlineCell.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 16.02.23.
//

import UIKit

final class HeadlineCell: UITableViewCell {

    static let identifier = "TableViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let byLineLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(byLineLabel)
        addSubview(sectionLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            sectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            byLineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            byLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }

    func configure(with viewModel: TopStoryHeadline) {
        titleLabel.text = viewModel.title
        byLineLabel.text = viewModel.byLine
        sectionLabel.text = viewModel.section
    }
}
