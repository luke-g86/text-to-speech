//
//  NewsViewModel.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol NewsViewModelDelegate: class {
    func fetchedData(with articles: [Articles]?)
    func fetchFailed(error reason: String)
}

class NewsViewModel {
    
    let disposeBag = DisposeBag()
    let news: BehaviorRelay<[Articles]> = BehaviorRelay(value: [])
    
    func fetchArticles() {
        
        APIConnection.getNews(url: APIConnection.baseURL.technology.url, response: News.self) { (result) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    
                    print(error.localizedDescription)
                }
            case .success(let response):
                DispatchQueue.main.async {
                    
                    self.news.accept(response.articles)
                    
                }
            }
        }
    }
    
}
