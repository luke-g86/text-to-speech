//
//  ViewController.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 15/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import UIKit
import AVFoundation
import RxSwift
import RxCocoa

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [Articles] = []
    let viewModel: NewsViewModel = NewsViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavBar()
        viewModel.fetchArticles()
        setTableView()
        setTable()
        cellTapHandling()
    }
    
    func setTable() {
        viewModel.news.asObservable().bind(to: tableView
            .rx
            .items(cellIdentifier: "cell", cellType: CustomTableViewCell.self)) {
                row, news, cell in
                cell.sourceName.text = news.source?.name
                cell.articleTitle.text = news.title
                cell.articleBody.text = news.content
                
                guard let stringURL = news.urlToImage else { return }
                let url = URL(string: stringURL)
                APIConnection.downloadThumbnail(imageURL: url!) { (data, error) in
                    guard let data = data else {
                        print(error?.localizedDescription)
                        return
                    }
                    cell.newsThumbnail.image = UIImage(data: data)
                }
        }
        .disposed(by: disposeBag)
    }
    
    func cellTapHandling() {
        tableView
        .rx
            .modelSelected(Articles.self)
            .subscribe(onNext: { [weak self] article in
            
                guard let strongSelf = self else { return }
                
                guard let articleDetailsVC = strongSelf.storyboard?.instantiateViewController(withIdentifier: "ArticleViewController") as? ArticleDetailsViewController else {
                    fatalError("Article Details Controller not found")
                }
                print(article.title)
                guard let title = article.title, let body = article.content else { return }
                articleDetailsVC.articleTitle.text = title
                articleDetailsVC.articleBody.text = body
                
                strongSelf.navigationController?.pushViewController(articleDetailsVC, animated: true)
            }).disposed(by: disposeBag)
    }
    
    func setTableView() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rx.setDelegate(self)
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "News for you"
    }
}



extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension NewsViewController: NewsViewModelDelegate {
    func fetchedData(with articles: [Articles]?) {
        guard let data = articles else {
            return
        }
        self.articles = data
        tableView.reloadData()
        
    }
    
    func fetchFailed(error reason: String) {
        print(print(reason))
    }

}

