//
//  HeadlinesViewController.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 15.02.23.
//

import UIKit
import RxSwift
import RxCocoa

final class HeadlinesViewController: UIViewController {

    typealias ViewModel = HeadlinesViewModel

    var viewModel: ViewModel

    private lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(HeadlineCell.self, forCellReuseIdentifier: HeadlineCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(newsTableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
