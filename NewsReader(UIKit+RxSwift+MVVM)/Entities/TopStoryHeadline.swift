//
//  TopStory.swift
//  NewsReader(UIKit+RxSwift+MVVM)
//
//  Created by Артем Галай on 13.02.23.
//

import Foundation

struct TopStoryHeadline: Decodable {
    struct Media: Decodable {
        let url: String
    }

    let title: String
    let url: String
    var section: String?
    var byLine: String?
}
