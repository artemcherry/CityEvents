//
//  EventView.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import UIKit

protocol EventViewProtocol: AnyObject {
    func updateEvent(model: EventModel)
}

class EventView: UIViewController, EventViewProtocol {
    
    
    
    private let eventTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MainPictureCell.self, forCellReuseIdentifier: MainPictureCell.identifier)
        table.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        table.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.identifier)
        table.register(DateCell.self, forCellReuseIdentifier: DateCell.identifier)
        table.register(PicturesCell.self, forCellReuseIdentifier: PicturesCell.identifier)
        return table
    }()
    
    var presenter: EventPresenterProtocol?
    var model: EventModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.updateEvent()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = model?.title
        print(model?.title)
    }
    
    private func setupUI() {
        
        view.addSubview(eventTableView)
        
        NSLayoutConstraint.activate([
            eventTableView.topAnchor.constraint(equalTo: view.topAnchor),
            eventTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateEvent(model: EventModel) {
        self.model = model
        self.eventTableView.reloadData()
    }
}
