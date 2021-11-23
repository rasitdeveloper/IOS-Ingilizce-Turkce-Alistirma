//
//  Kelimelerdao.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 21.11.2021.
//

import Foundation
class Kelimelerdao {
    let db:FMDatabase?
        
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("IngilizceTurkce2.sqlite")
            
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func rastgele5Getir () -> [Kelimeler] {
        var liste = [Kelimeler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Kelimeler ORDER BY RANDOM() LIMIT 5", values: nil)
            while(rs.next()) {
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!, ingilizce: rs.string(forColumn: "ingilizce")!, turkce: rs.string(forColumn: "turkce")!)
                liste.append(kelime)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
    
    
    func rastgele3YanlisSecenekGetir (kelime_id:Int) -> [Kelimeler] {
        var liste = [Kelimeler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Kelimeler WHERE kelime_id != ? ORDER BY RANDOM() LIMIT 3", values: [kelime_id])
            while(rs.next()) {
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!, ingilizce: rs.string(forColumn: "ingilizce")!, turkce: rs.string(forColumn: "turkce")!)
                liste.append(kelime)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
    
    func tumKelimeleriGetir() -> [Kelimeler]{
        var liste = [Kelimeler]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM Kelimeler", values: nil)
            while(rs.next()) {
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!, ingilizce: rs.string(forColumn: "ingilizce")!, turkce: rs.string(forColumn: "turkce")!)
                liste.append(kelime)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
    
    
    func kelimeAramaYap(aramaKelimesi:String) -> [Kelimeler]{
        var liste = [Kelimeler]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM Kelimeler WHERE ingilizce like '%\(aramaKelimesi)%' OR turkce like '%\(aramaKelimesi)%'", values: nil)
            while(rs.next()) {
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!, ingilizce: rs.string(forColumn: "ingilizce")!, turkce: rs.string(forColumn: "turkce")!)
                liste.append(kelime)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
}
