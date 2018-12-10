//
//  JsonTableViewCell.swift
//  Exercício Foundation JSON
//
//  Created by Lucas Pinheiro Almeida on 10/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit

class JsonTableViewCell: UITableViewCell {

    @IBOutlet weak var jsonText: UILabel!
    @IBOutlet weak var created_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
