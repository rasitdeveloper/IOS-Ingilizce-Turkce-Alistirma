//
//  SinavEkleViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class SinavEkleViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sinavAdiEkleTF: UITextField!
    @IBOutlet weak var dogruSayisiEkleTF: UITextField!
    @IBOutlet weak var yanlisSayisiEkleTF: UITextField!
    @IBOutlet weak var puanEkleTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    @IBAction func sinavKaydetButton(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let present = Date()
        print("kaydet e basildi")
        if let sinav_adi = sinavAdiEkleTF.text, let dogru_sayisi = dogruSayisiEkleTF.text, let yanlis_sayisi = yanlisSayisiEkleTF.text, let puan = puanEkleTF.text {
            if let dogru_sayisi = Int(dogru_sayisi), let yanlis_sayisi = Int(yanlis_sayisi), let puan = Int(puan) {
                Sinavlardao().sinavEkle(sinav_adi: sinav_adi, dogru_sayisi: dogru_sayisi, yanlis_sayisi: yanlis_sayisi, puan: puan, tarih: dateFormatter.string(from: present))
                navigationController?.popViewController(animated: true)
            }
        }
    }
    

}
