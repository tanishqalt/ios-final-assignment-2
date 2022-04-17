//
//  BeerTableViewCell.swift
//  BeerApp
//
//  Created by Tanishq Sharma on 2022-04-16.
//

import UIKit

struct BeerTableViewCellViewModel {
    let name: String
    let tagline: String
    let image_url: URL?
    let beerDescription: String
}

class BeerTableViewCell: UITableViewCell {
    
    // identifier
    static let identifier = "BeerTableViewCell"
    
    // subviews
    private let nameLabel: UILabel = {
        let label = UILabel();
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label;
    }()
    
    // subviews
    private let taglineLabel: UILabel = {
        let label = UILabel();
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label;
    }()
    
    // subviews
    private let descriptionLabel: UITextView = {
        let label = UITextView();
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label;
    }()
    

    // initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(taglineLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        nameLabel.sizeToFit()
        taglineLabel.sizeToFit()
        descriptionLabel.sizeToFit()
        
        nameLabel.frame = CGRect(
            x: 25,
            y: 0,
            width: contentView.frame.size.width,
            height: contentView.frame.size.height/6
        )
        
        taglineLabel.frame = CGRect(
            x: 25,
            y: contentView.frame.size.height/6,
            width: contentView.frame.size.width,
            height: contentView.frame.size.height/6
        )
        
        
        descriptionLabel.frame = CGRect(
            x: 25,
            y: (contentView.frame.size.height/6),
            width: contentView.frame.size.width / 1.1,
            height: contentView.frame.size.height/4
        )
    }
    // configure
    
    func configure(with viewModel:  BeerTableViewCellViewModel){
        nameLabel.text = viewModel.name
        taglineLabel.text = viewModel.tagline
        descriptionLabel.text = viewModel.beerDescription
    }
    
}
