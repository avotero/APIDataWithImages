//
//  ViewController.swift
//  APIDataWithImages
//
//  Created by administrator on 8/4/20.
//  Copyright © 2020 Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [ItemInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row].name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroViewController {
            destination.item = items[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    
    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://services.runescape.com/m=itemdb_rs/api/catalogue/items.json?category=10&alpha=c&page=1")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
         
            if error == nil {
                do {
                   let downloadedItems = try JSONDecoder().decode(Items.self, from: data!)
                    self.items = downloadedItems.items
                
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                }catch {
                    print(error)
                }
            }
        }.resume()
    }

}

