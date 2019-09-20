//
//  CustomTableViewCell.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
  lazy var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var newsThumbnail: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "news1")
        imageView.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        let thumbnailHeight = imageView.frame.height
        imageView.layer.cornerRadius = thumbnailHeight / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        
        return label
    }()
    
    lazy var articleBody: UITextView = {
        let textBody = UITextView()
        textBody.textAlignment = NSTextAlignment.justified
        textBody.translatesAutoresizingMaskIntoConstraints = false
        textBody.textContainer.maximumNumberOfLines = 5
        textBody.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        return textBody
    }()
    
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(cellView)
        cellView.addSubview(newsThumbnail)
        cellView.addSubview(articleTitle)
        cellView.addSubview(articleBody)
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    
    func addConstraints() {
        cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        cellView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
        
        newsThumbnail.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        newsThumbnail.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0).isActive = true
        newsThumbnail.heightAnchor.constraint(equalToConstant: 75).isActive = true
        newsThumbnail.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        articleTitle.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8).isActive = true
        articleTitle.leadingAnchor.constraint(equalTo: newsThumbnail.trailingAnchor, constant: 8).isActive = true
        articleTitle.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8).isActive = true
    
        articleBody.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 8).isActive = true
        articleBody.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor, constant: 0).isActive = true
        articleBody.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8).isActive = true
        articleBody.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 8).isActive = true
        
    }
    
}
