//
//  CustomTableViewCell.swift
//  Assignment4TableView
//
//  Created by Mac on 04/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
