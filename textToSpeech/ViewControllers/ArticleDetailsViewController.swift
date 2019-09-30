//
//  ArticleDetailsViewController.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 29/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//


import UIKit
import RxSwift


class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleBody: UITextView!
    @IBOutlet weak var playBtn: UIButton!
    
    let disposeBag = DisposeBag()
    let news = NewsViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func bind() {
//        articleTitle.rx.text.on()
//    }

}
