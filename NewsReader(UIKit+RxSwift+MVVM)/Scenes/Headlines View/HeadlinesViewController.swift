//
//  HeadlinesViewController.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 15.02.23.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class HeadlinesViewController: UIViewController {

    typealias ViewModel = HeadlinesViewModel

    var viewModel: ViewModel

    private let disposeBag = DisposeBag()

    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<NewsSection> { dataSource, tableView, indexPath, item in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeadlineCell.identifier, for: indexPath) as? HeadlineCell else {
            return UITableViewCell() }
        cell.configure(with: item)
        return cell
    }

    private lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
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
        configureViews()
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

private extension HeadlinesViewController {

    func configureViews() {
        configureTableView()
    }

    func configureTableView() {

        newsTableView.register(HeadlineCell.self, forCellReuseIdentifier: HeadlineCell.identifier)

        newsTableView.rx
            .itemSelected
            .subscribe(onNext: { [unowned self] indexPath in
                newsTableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)

        viewModel
            .headlines
            .drive(newsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension HeadlinesViewController: UITableViewDelegate {

}
