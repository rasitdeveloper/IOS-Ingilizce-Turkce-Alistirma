//
//  SinavlarListesiViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class SinavlarListesiViewController: UIViewController {

    @IBOutlet weak var sinavlarTableView: UITableView!
    var sinavlarListe = [Sinavlar]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let present = Date()

        let n1 = Sinavlar(sinav_id: 1, sinav_adi: "YDS", dogru_sayisi: 65, yanlis_sayisi: 5, puan: 90, tarih: dateFormatter.string(from: present))
        let n2 = Sinavlar(sinav_id: 2, sinav_adi: "YDSx", dogru_sayisi: 66, yanlis_sayisi: 4, puan: 91, tarih: dateFormatter.string(from: present))
        let n3 = Sinavlar(sinav_id: 3, sinav_adi: "YDSy", dogru_sayisi: 67, yanlis_sayisi: 3, puan: 92, tarih: dateFormatter.string(from: present))
        
        sinavlarListe.append(n1)
        sinavlarListe.append(n2)
        sinavlarListe.append(n3)
        */
        
        sinavlarTableView.delegate = self
        sinavlarTableView.dataSource = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        if segue.identifier == "toSinavDetay" {
            let gidilecekVC = segue.destination as! SinavDetayViewController
            gidilecekVC.sinav = sinavlarListe[indeks!]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sinavlarListe = Sinavlardao().tumSinavlarAl()
        sinavlarTableView.reloadData()
    }
    



}

extension SinavlarListesiViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sinavlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sinav = sinavlarListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sinavHucre", for: indexPath) as! SinavHucreTableViewCell
        cell.sinavAdiLabel.text = sinav.sinav_adi
        cell.dogruSayisiLabel.text = String(sinav.dogru_sayisi!)
        cell.yanlisSayisiLabel.text = String(sinav.yanlis_sayisi!)
        cell.puanLabel.text = String(sinav.puan!)
        cell.tarihLabel.text = sinav.tarih
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toSinavDetay", sender: indexPath.row )
    }
}
