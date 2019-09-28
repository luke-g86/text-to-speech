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
    let viewModel: NewsViewModel = NewsViewModel(delegate: nil)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavBar()
//        let newsViewModel = NewsViewModel(delegate: self)
//        newsViewModel.fetchArticles()
        viewModel.fetchArticles()
        setTableView()
        setTable()
        print(viewModel.news.value)
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
    
    func setTableView() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rx.setDelegate(self)
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "News for you"
    }
    
    //    func textToSpeech() {
    //        guard let text = textField.text else {return}
    //        let speak = TextToSpeech.init(textToBeSaid: text)
    //        speak.speak()
    //    }
    
    //    func setButton() {
    //        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    //        button.setTitleColor(UIColor.white, for: .normal)
    //        button.layer.cornerRadius = 4
    //    }
    
    
    
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

