//
//  SonucEkraniViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 21.11.2021.
//

import UIKit

class SonucEkraniViewController: UIViewController {

    @IBOutlet weak var labelDogruYanlis: UILabel!
    
    var dogruSayisi:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.hidesBackButton = true
        if let d = dogruSayisi {
            labelDogruYanlis.text = "\(d) Doğru \(5-d) Yanlış"
        }
    }
    

    @IBAction func buttonToAnasayfa(_ sender: Any) {
        // navigationController?.popToRootViewController(animated: true)
    }
    
    
}
