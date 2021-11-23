//
//  KelimeHucreTableViewCell.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class KelimeHucreTableViewCell: UITableViewCell {

    @IBOutlet weak var ingilizceTableLabel: UILabel!
    @IBOutlet weak var turkceTableLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
