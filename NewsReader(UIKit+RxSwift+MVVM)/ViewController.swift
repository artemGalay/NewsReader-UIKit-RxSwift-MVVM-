//
//  ViewController.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 17.02.23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewDidLoad()
        let service = NewsService()
        let viewModel = HeadlinesViewModel(service: service)
        let viewController = HeadlinesViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
}
