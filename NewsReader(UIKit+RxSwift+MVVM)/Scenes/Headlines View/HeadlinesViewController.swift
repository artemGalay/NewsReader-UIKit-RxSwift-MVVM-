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

    let viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
