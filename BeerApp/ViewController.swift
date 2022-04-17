//
//  ViewController.swift
//  BeerApp
//
//  Created by Tanishq Sharma on 2022-04-16.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
   
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.identifier)
        return tableView
    }()
    
    private var viewModels = [BeerTableViewCellViewModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Beer Inventory App"
        view.addSubview(tableView)
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        
        BeerAPI.shared.fetchCryptoData(completion: { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    // Using a number formatter to make sure the price is converted from float to symbol
                    BeerTableViewCellViewModel(
                        name: model.name ?? "N/A",
                        tagline: model.tagline ?? "N/A", image_url: model.image_url,
                        beerDescription: model.description ?? "N/A"
                )})
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                print("Total Count \(models)")
            case .failure(let error):
                print(error)
            }
            
        })
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for:  indexPath) as? BeerTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row]);
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedBeerController {
            destination.id = tableView.indexPathForSelectedRow?.row ?? 10
            destination.name = viewModels[tableView.indexPathForSelectedRow?.row ?? 0].name
            destination.tagline = viewModels[tableView.indexPathForSelectedRow?.row ?? 0].tagline
            destination.beerDescription = viewModels[tableView.indexPathForSelectedRow?.row ?? 0].tagline
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
}

