//
//  DetailedBeerController.swift
//  BeerApp
//
//  Created by Tanishq Sharma on 2022-04-16.
//

import UIKit

class DetailedBeerController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var savedListTable: UITableView!
    
    @IBOutlet weak var displayText: UILabel!
    
    var beers:[Beer] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var id = 0;
    var name = "Pilsen Lager"
    var beerDescription = "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once."
    var tagline = " Real Bitter Experience."

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayText.text = String(name);
        
        savedListTable.delegate = self;
        savedListTable.dataSource = self

        fetchBeers()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchBeers(){
        do {
            self.beers = try context.fetch(Beer.fetchRequest())
            
            DispatchQueue.main.async {
                self.savedListTable.reloadData()
            }
        } catch {
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath)
        cell.textLabel?.text = beers[indexPath.row].name
        return cell
    }
       
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func savePressed(_ sender: Any) {
        let newBeer = Beer(context: self.context)
        newBeer.name = self.name
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
        
        self.fetchBeers()
    }
    
}
