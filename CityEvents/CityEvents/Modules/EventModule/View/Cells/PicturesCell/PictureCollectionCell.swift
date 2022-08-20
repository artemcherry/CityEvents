//
//  PictureCollectionCell.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import UIKit

class PictureCollectionCell: UICollectionViewCell {
    
    static let identifier = "PictureCollectionCell"
    
    private let eventImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
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
        eventImage.image = nil
    }
    
    private func setupUI() {
        contentView.addSubview(eventImage)
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setupCell(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        eventImage.load(url: url)
    }
}
