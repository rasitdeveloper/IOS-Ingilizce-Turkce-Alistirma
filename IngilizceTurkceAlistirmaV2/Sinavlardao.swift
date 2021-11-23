//
//  Sinavlardao.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 22.11.2021.
//

import Foundation
class Sinavlardao {
    
    let db:FMDatabase?
        
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("IngilizceTurkce2.sqlite")
            
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumSinavlarAl() -> [Sinavlar] {
        var liste = [Sinavlar]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM Sinavlar", values: nil)
            while rs.next() {
                let sinav = Sinavlar(sinav_id: Int(rs.string(forColumn: "sinav_id"))!, sinav_adi: rs.string(forColumn: "sinav_adi")!, dogru_sayisi: Int(rs.string(forColumn: "dogru_sayisi"))!, yanlis_sayisi: Int(rs.string(forColumn: "yanlis_sayisi"))!, puan: Double(rs.string(forColumn: "puan"))!, tarih: rs.string(forColumn: "tarih")!)
                liste.append(sinav)
            }
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        return liste
    }
    
    func sinavEkle(sinav_adi:String, dogru_sayisi:Int, yanlis_sayisi:Int, puan: Int, tarih:String) {
        db?.open()
        
        do {
            try db?.executeUpdate("INSERT INTO Sinavlar (sinav_adi,dogru_sayisi,yanlis_sayisi,puan,tarih) VALUES (?,?,?,?,?)", values: [sinav_adi,dogru_sayisi,yanlis_sayisi,puan,tarih])
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sinavGuncelle(sinav_id:Int, sinav_adi:String, dogru_sayisi:Int, yanlis_sayisi:Int, puan: Int, tarih:String) {
        db?.open()
        
        do {
            try db?.executeUpdate("UPDATE Sinavlar SET sinav_adi = ?, dogru_sayisi = ?, yanlis_sayisi = ?, puan = ?, tarih = ? WHERE sinav_id = ?", values: [sinav_adi,dogru_sayisi,yanlis_sayisi,puan,tarih,sinav_id])
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sinavSil(sinav_id:Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("DELETE FROM Sinavlar WHERE sinav_id = ?", values: [sinav_id])
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}
