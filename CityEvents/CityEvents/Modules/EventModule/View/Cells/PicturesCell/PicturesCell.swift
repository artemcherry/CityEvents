//
//  PicturesCell.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import UIKit

class PicturesCell: UITableViewCell {
    
    static let identifier = "PicturesCell"
    
    private let imageCollection: UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 200)
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PictureCollectionCell.self, forCellWithReuseIdentifier: PictureCollectionCell.identifier)
        
        return collection
    }()
    
    var model =  EventModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageCollection.dataSource = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        self.contentView.addSubview(imageCollection)
        
        NSLayoutConstraint.activate([
            imageCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
}

extension PicturesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.images!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionCell.identifier, for: indexPath) as? PictureCollectionCell else { return UICollectionViewCell() }
        if let pictures = model.images {
            cell.setupCell(urlString: pictures[indexPath.row])
        }
        return cell
    }
    
    
}

