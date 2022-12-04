//
//  ViewController.swift
//  CommitHistory
//
//  Created by Mayur Kant Tyagi on 04/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var network = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        network.apiCall { model, isError in
            if isError{
                print(" Data not Found")
            }else{
                print(model)
            }
        }

    }

    
    
}

