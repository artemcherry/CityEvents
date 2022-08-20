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
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let eventTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold ", size: 10)
        label.contentMode = .center
        label.backgroundColor = .clear
        label.textAlignment = .center
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        eventImageView.image = nil
        eventTitle.text = nil
    }
    private func setupUI() {
        
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.cornerRadius = 15
        self.contentView.clipsToBounds = true
        contentView.addSubview(eventImageView)
        contentView.addSubview(eventTitle)
            
        NSLayoutConstraint.activate([
        
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(contentView.bounds.height / 3) ),
            
            eventTitle.topAnchor.constraint(equalTo: eventImageView.bottomAnchor),
            eventTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            eventTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            eventTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setupCell(model: EventModel) {
        eventTitle.text = model.title.capitalizingFirstLetter()
        if let urlString = model.images?.first, let url = URL(string: urlString) {
            eventImageView.load(url: url)
        }
        else {
            eventImageView.image = UIImage(named: "imagePlaceHolder")
        }
    }
}
