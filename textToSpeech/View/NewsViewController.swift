//
//  ViewController.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 15/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import UIKit
import AVFoundation

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var articles: [Articles] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        let newsViewModel = NewsViewModel(delegate: self)
        newsViewModel.fetchArticles()
        setTableView()
        
       
    }
    
    func setTableView() {
         tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
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



extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
    
        cell.articleTitle.text = articles[indexPath.row].title
        cell.articleBody.text = articles[indexPath.row].content
    
        if let urlToImage = articles[indexPath.row].urlToImage {
        let url = URL(string: urlToImage)
            APIConnection.downloadThumbnail(imageURL: url!) { (data, error) in
                guard let data = data else {
                    print(error?.localizedDescription)
                    return
            }
                cell.newsThumbnail.image = UIImage(data: data)
        }
       
        }
     
        return cell
    }
    
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

