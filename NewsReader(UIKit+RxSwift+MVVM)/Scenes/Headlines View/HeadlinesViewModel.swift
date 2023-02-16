//
//  HeadlinesViewModel.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 15.02.23.
//

import Foundation
import RxSwift
import RxCocoa

final class HeadlinesViewModel {

    let headlines: Driver<[TopStoryHeadline]>

    private let service: NewsServiceType

    init(service: NewsServiceType) {
        self.service = service
        headlines = service
            .getTopHeadline()
            .asDriver(onErrorJustReturn: [])
    }
}
