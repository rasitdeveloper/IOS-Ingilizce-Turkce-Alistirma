//
//  ViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 21.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelKelimeArastir: UIButton!
    @IBOutlet weak var labelTestYap: UIButton!
    @IBOutlet weak var labelSinavGorKaydet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        veritabaniKopyala()
        
    }
    
    func veritabaniKopyala(){
            
        let bundleYolu = Bundle.main.path(forResource: "IngilizceTurkce2", ofType: ".sqlite")
            
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
        let fileManager = FileManager.default
            
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("IngilizceTurkce2.sqlite")
            
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var.Kopyalamaya gerek yok")
        }else{
            do {
                    
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                    
            }catch{
                print(error)
            }
        }
    }


}

