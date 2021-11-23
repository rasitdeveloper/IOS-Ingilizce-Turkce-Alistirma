//
//  Kelimeler.swift
//  IngilizceTurkceAlistirmaV2
//
//  Created by Rasit on 21.11.2021.
//

import Foundation
class Kelimeler: Equatable, Hashable {
    var kelime_id:Int?
    var ingilizce:String?
    var turkce:String?
    
    init() {
        
    }
    
    init(kelime_id:Int, ingilizce:String, turkce:String) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
    
    var hashValue: Int {
        get {
            return kelime_id.hashValue
        }
    }
    
    static func == (lhs:Kelimeler,rhs:Kelimeler) -> Bool {
        return lhs.kelime_id == rhs.kelime_id
    }
}
