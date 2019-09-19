//
//  NewsViewModel.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation

protocol NewsViewModelDelegate: class {
    func fetchedData(with articles: [Articles]?)
    func fetchFailed(error reason: String)
}

class NewsViewModel {
    
    private weak var delegate: NewsViewModelDelegate?
    var articles: [Articles] = []
    
    init(delegate: NewsViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchArticles() {
        
        APIConnection.getNews(url: APIConnection.baseURL.technology.url, response: News.self) { (result) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.fetchFailed(error: error.details)
                    print(error.localizedDescription)
                }
            case .success(let response):
                DispatchQueue.main.async {
                    self.articles = response.articles
                    self.delegate?.fetchedData(with: self.articles)
                }
            }
        }
    }
    
}
