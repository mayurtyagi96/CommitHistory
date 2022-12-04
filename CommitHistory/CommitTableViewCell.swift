//
//  CommitTableViewCell.swift
//  CommitHistory
//
//  Created by Mayur Kant Tyagi on 04/12/22.
//

import UIKit

class CommitTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCornerAndShadow()

    }
    
//MARK:- Setting values on UI
    func populateData(title: String, imageUrl: String, name: String, date: String){
        titleLabel.text = "Message:- \(title)"
        nameLabel.text = "\(name)"
        createdDateLabel.text = " Committed On:- \(date.toDate())  "
        if let url = URL(string: imageUrl){
            if let data = try? Data(contentsOf: url ){
                userImageView.image = UIImage(data: data)
            }
        }        
    }
    
// MARK:- Setup Corner Radius and Shadow
    func setupCornerAndShadow(){
        self.stackView.layer.cornerRadius = 5
        self.stackView.layer.masksToBounds = false
        self.stackView.layer.shadowOffset = CGSizeMake(0, 0)
        self.stackView.layer.shadowColor = UIColor.black.cgColor
        self.stackView.layer.shadowOpacity = 0.4
        self.stackView.layer.shadowRadius = 2
        userImageView.layer.cornerRadius = 25
    }
    
    


}


