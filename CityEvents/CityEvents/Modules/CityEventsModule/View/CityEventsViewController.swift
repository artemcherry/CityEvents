//
//  CityEventsViewController.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

protocol CityEventsViewProtocol: AnyObject {
    var presenter: CityEventsPresenterProtocol? {get set}
}

class CityEventsView: UIViewController, CityEventsViewProtocol {
    
    private let eventsCollectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        let estimatedSize: CGFloat = (UIScreen.main.bounds.width  - 60) / 2
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: estimatedSize, height: estimatedSize)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(EventCollectionCell.self, forCellWithReuseIdentifier: EventCollectionCell.identifier)
        
        return collection
    }()
    
    var presenter: CityEventsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(eventsCollectionView)
        
        NSLayoutConstraint.activate([
            eventsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            eventsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
//MARK: CollectionView DataSource&Delegate
extension CityEventsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionCell.identifier, for: indexPath) as? EventCollectionCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
