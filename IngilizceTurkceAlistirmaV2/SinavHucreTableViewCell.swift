//
//  SinavHucreTableViewCell.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class SinavHucreTableViewCell: UITableViewCell {

    @IBOutlet weak var sinavAdiLabel: UILabel!
    @IBOutlet weak var dogruSayisiLabel: UILabel!
    @IBOutlet weak var yanlisSayisiLabel: UILabel!
    @IBOutlet weak var puanLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
