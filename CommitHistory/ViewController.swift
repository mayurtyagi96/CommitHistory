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
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(getCommitHistory), for: .allEvents)
        tableView.dataSource = self
        self.getCommitHistory()
        navigationSetup()
      

    }
}

// MARK:- TableView Delegate Functions
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

// MARK:- Navigation Setup
extension ViewController{
    func navigationSetup(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Commit History"
    }
    
    @objc func getCommitHistory(){
        refreshControl.beginRefreshing()
        network.apiCall { model, isError in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
            
                  if isError{
                      print(" Data not Found")
                  }else{
                      print(model)
                      self.myModel = model ?? []
                   }
        }
    }
}
extension String{
    func toDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
    
}

