//
//  HeadlinesViewModel.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 15.02.23.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

extension TopStoryHeadline: IdentifiableType, Equatable {

    static func == (lhs: TopStoryHeadline, rhs: TopStoryHeadline) -> Bool {
        lhs.title == rhs.title
    }

    var identity: some Hashable {
        title
    }
}

//MARK: - Не зависимо от того есть ли в таблице секции RxDataSources требует данные в формате секции
struct NewsSection {

    let identity: String

    var items: [TopStoryHeadline]
}

//MARK: - Нужно удовлетворить требованиям протокола AnimatableSectionModelType
extension NewsSection: AnimatableSectionModelType {

    init(original: NewsSection, items: [TopStoryHeadline]) {
        self = original
        self.items = items
    }

}
final class HeadlinesViewModel {

    let headlines: Driver<[NewsSection]>

    private let service: NewsServiceType

    init(service: NewsServiceType) {
        self.service = service
        headlines = service
            .getTopHeadline()
            .map { headlines in
                return [
                    NewsSection(identity: UUID().uuidString,
                                   items: headlines)
                ]
            }
            .asDriver(onErrorJustReturn: [])
    }
}
