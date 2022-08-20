//
//  MainPictureCell.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import UIKit

class MainPictureCell: UITableViewCell {
    
    static let identifier = "MainPictureCell"
    
    private let eventPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imagePlaceHolder")
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.contentView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        self.contentView.addSubview(eventPicture)
        
        NSLayoutConstraint.activate([
            eventPicture.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventPicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventPicture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventPicture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupCell(model: EventModel) {
        if let urlString = model.images?.first, let url = URL(string: urlString) {
            eventPicture.load(url: url)
        }
        
    }
    
}
