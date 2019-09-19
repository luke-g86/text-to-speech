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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var articleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        
        return label
    }()
    
    lazy var articleBody: UITextView = {
        let textBody = UITextView()
        textBody.
        
        return textBody
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.contentView.addSubview(cellView)
        cellView.addSubview(newsThumbnail)
        cellView
    }
    
}
