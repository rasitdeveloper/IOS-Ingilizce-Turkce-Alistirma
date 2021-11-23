//
//  KelimeDetayViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class KelimeDetayViewController: UIViewController {

    @IBOutlet weak var ingilizceDetayLabel: UILabel!
    @IBOutlet weak var turkceDetayLabel: UILabel!
    var kelime:Kelimeler?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let k = kelime {
            ingilizceDetayLabel.text = k.ingilizce
            turkceDetayLabel.text = k.turkce
        }
    }
    


}
