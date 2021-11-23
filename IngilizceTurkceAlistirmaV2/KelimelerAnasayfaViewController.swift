//
//  KelimelerAnasayfaViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import UIKit

class KelimelerAnasayfaViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kelimelerTable: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // let k1 = Kelimeler(kelime_id: 1, ingilizce: "deneme", turkce: "deneme1")
        // let k2 = Kelimeler(kelime_id: 2, ingilizce: "deneme2", turkce: "deneme3")
        
        // kelimeListesi.append(k1)
        // kelimeListesi.append(k2)
        
        kelimelerTable.delegate = self
        kelimelerTable.dataSource = self
        
        searchBar.delegate = self
        
        kelimeListesi = Kelimelerdao().tumKelimeleriGetir()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        gidilecekVC.kelime = kelimeListesi[indeks!]
        
        
    }
    

    

}


extension KelimelerAnasayfaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kelime = kelimeListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre", for: indexPath) as! KelimeHucreTableViewCell
        cell.ingilizceTableLabel.text = kelime.ingilizce
        cell.turkceTableLabel.text = kelime.turkce
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toKelimeDetay", sender: indexPath.row)
    }
    
    
}


extension KelimelerAnasayfaViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        kelimeListesi = Kelimelerdao().kelimeAramaYap(aramaKelimesi: searchText)
        kelimelerTable.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
