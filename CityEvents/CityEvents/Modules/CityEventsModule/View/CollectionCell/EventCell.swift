//
//  EventCell.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

class EventCollectionCell: UICollectionViewCell {
    
    static let identifier = "EventCollectionCell"
    
    private let eventImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imagePlaceHolder")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let eventTitle: UILabel = {
        let label = UILabel()
        label.text = "Welcome to some event"
        label.font = UIFont(name: "AvenirNext-DemiBold ", size: 10)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .gray
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(eventImageView)
        contentView.addSubview(eventTitle)
            
        NSLayoutConstraint.activate([
        
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(contentView.bounds.height / 3) * 2),
            
            eventTitle.topAnchor.constraint(equalTo: eventImageView.bottomAnchor),
            eventTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
