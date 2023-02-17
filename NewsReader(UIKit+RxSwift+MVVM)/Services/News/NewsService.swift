//
//  NewsService.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 13.02.23.
//

import Foundation
import RxSwift

protocol NewsServiceType {
    func getTopHeadline() -> Observable<[TopStoryHeadline]>
}

final class NewsService: NewsServiceType {
    func getTopHeadline() -> Observable<[TopStoryHeadline]> {
        return Observable.just([
            TopStoryHeadline(title: UUID().uuidString, url: ""),
            TopStoryHeadline(title: UUID().uuidString, url: ""),
            TopStoryHeadline(title: UUID().uuidString, url: ""),
            TopStoryHeadline(title: UUID().uuidString, url: ""),
            TopStoryHeadline(title: UUID().uuidString, url: "")
        ])
    }
}



