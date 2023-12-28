//
//  TableViewCell.swift
//  UniversityList API
//
//  Created by Celestial on 07/12/23.
//

import UIKit

class TableViewCell: UITableViewCell
{

    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    override func awakeFromNib() 
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
