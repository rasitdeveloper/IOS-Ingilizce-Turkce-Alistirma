//
//  Sinavlar.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import Foundation
class Sinavlar {
    var sinav_id:Int?
    var sinav_adi:String?
    var dogru_sayisi:Int?
    var yanlis_sayisi:Int?
    var puan:Double?
    var tarih:String?
    
    init() {
        
    }
    
    init(sinav_id:Int, sinav_adi:String, dogru_sayisi:Int, yanlis_sayisi:Int, puan:Double, tarih:String) {
        self.sinav_id = sinav_id
        self.sinav_adi = sinav_adi
        self.dogru_sayisi = dogru_sayisi
        self.yanlis_sayisi = yanlis_sayisi
        self.puan = puan
        self.tarih = tarih
    }
}
