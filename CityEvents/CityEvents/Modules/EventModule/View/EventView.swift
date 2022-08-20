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
        table.separatorStyle = .none
        table.adjustedContentInsetDidChange()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(MainPictureCell.self, forCellReuseIdentifier: MainPictureCell.identifier)
        table.register(EventOverviewCell.self, forCellReuseIdentifier: EventOverviewCell.identifier)
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
        eventTableView.dataSource = self
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

extension EventView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "О событии"
        case 2:
            let picturesWithoutFirst = model?.images?.dropFirst()

            if picturesWithoutFirst?.count ?? 0 > 1 {
                return "Галерея"
            }
            else {
                return ""
            }
        default: return ""
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            guard let reuseCell = tableView.dequeueReusableCell(withIdentifier: MainPictureCell.identifier, for: indexPath) as? MainPictureCell
                     else { return UITableViewCell() }
            reuseCell.setupCell(model: model ?? EventModel())
            cell = reuseCell
        case 1:
            guard let reuseCell = tableView.dequeueReusableCell(withIdentifier: EventOverviewCell.identifier, for: indexPath) as? EventOverviewCell
                     else { return UITableViewCell() }
            reuseCell.setupCell(model: model ?? EventModel())
            cell = reuseCell
        case 2:
            guard let reuseCell = tableView.dequeueReusableCell(withIdentifier: PicturesCell.identifier, for: indexPath) as? PicturesCell,
                  let model = model
                     else { return UITableViewCell() }
            reuseCell.model = model
            cell = reuseCell
        default:  break
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    
}
