//
//  QuizEkraniViewController.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 21.11.2021.
//

import UIKit

class QuizEkraniViewController: UIViewController {

    @IBOutlet weak var labelDogruSayisi: UILabel!
    @IBOutlet weak var labelYanlisSayisi: UILabel!
    @IBOutlet weak var labelSoruSayisi: UILabel!
    @IBOutlet weak var labelIngilizceKelime: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    var sorular = [Kelimeler]()
    var yanlisSecenekler = [Kelimeler]()
    var dogruSoru = Kelimeler()
    var soruSayac = 0
    var dogruSayac = 0
    var yanlisSayac = 0
    var secenekler = [Kelimeler]()
    var seceneklerKaristirmaListesi = Set <Kelimeler>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sorular = Kelimelerdao().rastgele5Getir()
        soruYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekVC = segue.destination as! SonucEkraniViewController
        gidilecekVC.dogruSayisi = dogruSayac
    }
    
    func soruYukle() {
        labelSoruSayisi.text = "\(soruSayac+1). SORU"
        labelDogruSayisi.text = "Doğru : \(dogruSayac)"
        labelYanlisSayisi.text = "Yanlış : \(yanlisSayac)"
        
        dogruSoru = sorular[soruSayac]
        labelIngilizceKelime.text = dogruSoru.ingilizce
        yanlisSecenekler = Kelimelerdao().rastgele3YanlisSecenekGetir(kelime_id: dogruSoru.kelime_id!)
        seceneklerKaristirmaListesi.removeAll()
        seceneklerKaristirmaListesi.insert(dogruSoru)
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[0])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[1])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[2])
        secenekler.removeAll()
        for x in seceneklerKaristirmaListesi {
            secenekler.append(x)
        }
        buttonA.setTitle(secenekler[0].turkce, for: .normal)
        buttonB.setTitle(secenekler[1].turkce, for: .normal)
        buttonC.setTitle(secenekler[2].turkce, for: .normal)
        buttonD.setTitle(secenekler[3].turkce, for: .normal)
        
    }
    
    func dogruKontrol(button:UIButton) {
        let buttonYazi = button.titleLabel?.text
        let dogruCevap = dogruSoru.turkce
        if dogruCevap == buttonYazi {
            dogruSayac += 1
        } else {
            yanlisSayac += 1
        }
        labelDogruSayisi.text = "Doğru : \(dogruSayac)"
        labelYanlisSayisi.text = "Yanlış : \(yanlisSayac)"
    }
    
    func soruSayacKontrol() {
        soruSayac += 1
        if soruSayac != 5 {
            soruYukle()
        } else {
            performSegue(withIdentifier: "toSonucEkrani", sender: nil)
        }
    }
    
    @IBAction func buttonATikla(_ sender: Any) {
        dogruKontrol(button: buttonA)
        soruSayacKontrol()
    }
    
    @IBAction func buttonBTikla(_ sender: Any) {
        dogruKontrol(button: buttonB)
        soruSayacKontrol()
    }
    
    @IBAction func buttonCTikla(_ sender: Any) {
        dogruKontrol(button: buttonC)
        soruSayacKontrol()
    }
    
    @IBAction func buttonDTikla(_ sender: Any) {
        dogruKontrol(button: buttonD)
        soruSayacKontrol()
    }
    
    
    
}
