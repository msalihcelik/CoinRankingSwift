//
//  CoinVM.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 16.07.2021.
//

import Foundation

struct CoinVM {
    let coins: Welcome
    
    var name: String {
        return self.coins.name
    }
    
    var iconUrl: String? {
        return self.coins.image
    }
    
    var price: Double {
        return self.coins.currentPrice
    }
    
    var rank: Int {
        return self.coins.marketCapRank
    }
    
    var low24h: Double {
        return self.coins.low24H
    }
    
    var high24h: Double {
        return self.coins.high24H
    }
    
    var lowAll: Double {
        return self.coins.atl
    }
    
    var highAll: Double {
        return self.coins.ath
    }
    
    var marketVal: Int {
        return self.coins.marketCap
    }
    
    var totalVolume: Int {
        return self.coins.totalVolume
    }
    
}
