//
//  CommitTableViewCell.swift
//  CommitHistory
//
//  Created by Mayur Kant Tyagi on 04/12/22.
//

import UIKit

class CommitTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(title: String, imageUrl: String, name: String, date: String){
        titleLabel.text = title
        nameLabel.text = name
        createdDateLabel.text = date
        if let url = URL(string: imageUrl){
            if let data = try? Data(contentsOf: url ){
                userImageView.image = UIImage(data: data)
            }

        }        
    }

}
