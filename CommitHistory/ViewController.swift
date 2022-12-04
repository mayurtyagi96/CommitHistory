//
//  ViewController.swift
//  CommitHistory
//
//  Created by Mayur Kant Tyagi on 04/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var network = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        network.apiCall { model, isError in
            if isError{
                print(" Data not Found")
            }else{
                print(model)
            }
        }

    }

    
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitTableViewCell", for: indexPath) as! CommitTableViewCell
        cell.populateData(title: "commit Successful", imageUrl: "", name: "MAYUR", date: "23-03-2000")
        return cell
    }
    
    
    
    
    
    
    
}
