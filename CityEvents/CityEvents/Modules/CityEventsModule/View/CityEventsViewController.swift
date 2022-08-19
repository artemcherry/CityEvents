//
//  CityEventsViewController.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

protocol CityEventsViewProtocol: AnyObject {
    var presenter: CityEventsPresenterProtocol? {get set}
    func updateModels(models: [EventModel])
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
    var models: [EventModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        presenter?.getEvents()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Events in Moscow"
        
        view.addSubview(eventsCollectionView)
        
        NSLayoutConstraint.activate([
            eventsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            eventsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateModels(models: [EventModel]) {
        self.models = models
        self.eventsCollectionView.reloadData()
    }
}

//MARK: CollectionView DataSource&Delegate
extension CityEventsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionCell.identifier, for: indexPath) as? EventCollectionCell else { return UICollectionViewCell() }
        if let item = models?[indexPath.row] {
            cell.setupCell(model: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let models = models else {return}
        presenter?.openEvent(event: models[indexPath.row])
    }
}
