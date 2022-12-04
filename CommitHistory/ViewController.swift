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
    var myModel: [CommitModelElement] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        let attrs = [
//          NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 17)!
//        ]

        self.navigationItem.title = "hello github user"
        
        tableView.dataSource = self
        self.getCommitHistory()
      

    }
    func getCommitHistory(){
        network.apiCall { model, isError in
                  if isError{
                      print(" Data not Found")
                  }else{
                      print(model)
                      self.myModel = model ?? []
                  }
              }
    }

    
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitTableViewCell", for: indexPath) as! CommitTableViewCell
        let data = myModel[indexPath.row]
        cell.populateData(title: data.commit?.message ?? "Commit Changes", imageUrl: data.committer?.avatarURL ?? "", name: data.commit?.committer.name ?? "User", date: data.commit?.committer.date ?? "")
        return cell
    }
    
    
    
    
    
    
    
}
