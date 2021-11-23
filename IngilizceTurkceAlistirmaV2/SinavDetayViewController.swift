//
//  SinavDetayViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class SinavDetayViewController: UIViewController {

    @IBOutlet weak var sinavAdiDetayTF: UITextField!
    @IBOutlet weak var dogruSayisiDetayTF: UITextField!
    @IBOutlet weak var yanlisSayisiDetayTF: UITextField!
    @IBOutlet weak var puanDetayTF: UITextField!
    
    var sinav:Sinavlar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let s = sinav {
            sinavAdiDetayTF.text = s.sinav_adi
            dogruSayisiDetayTF.text = String(s.dogru_sayisi!)
            yanlisSayisiDetayTF.text = String(s.yanlis_sayisi!)
            puanDetayTF.text = String(s.yanlis_sayisi!)
        }
    }
    
    @IBAction func sinavSilButton(_ sender: Any) {
        print("sile basildi")
        if let s = sinav {
            Sinavlardao().sinavSil(sinav_id: s.sinav_id!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func notGuncelleButton(_ sender: Any) {
        print("guncelleye basildi")
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let present = Date()
        if let sinav_adi = sinavAdiDetayTF.text, let dogru_sayisi = dogruSayisiDetayTF.text, let yanlis_sayisi = yanlisSayisiDetayTF.text, let puan = puanDetayTF.text {
            if let s = sinav, let dogru_sayisi = Int(dogru_sayisi), let yanlis_sayisi = Int(yanlis_sayisi), let puan = Int(puan) {
                Sinavlardao().sinavGuncelle(sinav_id: s.sinav_id!, sinav_adi: sinav_adi, dogru_sayisi: dogru_sayisi, yanlis_sayisi: yanlis_sayisi, puan: puan, tarih: dateFormatter.string(from: present))
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
