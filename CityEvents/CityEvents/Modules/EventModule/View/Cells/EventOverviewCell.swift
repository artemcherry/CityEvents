//
//  TitleCell.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import UIKit

class EventOverviewCell: UITableViewCell {
    
    private let titileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold ", size: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionText: UITextView = {
        let text = UITextView()
        text.font = UIFont(name: "ArialMT", size: 14)
        text.adjustsFontForContentSizeCategory = true
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    static let identifier = "TitleCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.contentView.addSubview(titileLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            titileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titileLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titileLabel.heightAnchor.constraint(equalToConstant: 40),

            dateLabel.topAnchor.constraint(equalTo: titileLabel.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionText.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func setupCell(model: EventModel) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        titileLabel.text = model.title.capitalizingFirstLetter()
        dateLabel.text = "Начало: \(dateFormater.string(from: model.startDate ?? Date()))"
        descriptionText.text = model.description
    }
}
