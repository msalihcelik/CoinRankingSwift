//
//  HomeVM.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 16.07.2021.
//

import Foundation

struct HomeVM {
    var home: [Welcome]
    
    func numOfRows() -> Int {
        return self.home.count
    }
    
    func getCoinName(_ index: Int) -> String {
        return CoinVM(coins: home[index]).name
    }
    
    func getIconUrl(_ index: Int) -> String? {
        return CoinVM(coins: home[index]).iconUrl
    }
    
    func getPrice(_ index: Int) -> Double {
        return CoinVM(coins: home[index]).price
    }
    
    func getRank(_ index: Int) -> Int {
        return CoinVM(coins: home[index]).rank
    }
    
    func getLow24h(_ index: Int) -> Double {
        return CoinVM(coins: home[index]).low24h
    }
    
    func getHigh24h(_ index: Int) -> Double {
        return CoinVM(coins: home[index]).high24h
    }
    
    func getLowAll(_ index: Int) -> Double {
        return CoinVM(coins: home[index]).lowAll
    }
    
    func getHighAll(_ index: Int) -> Double {
        return CoinVM(coins: home[index]).highAll
    }
    
    func getMarketVal(_ index: Int) -> Int {
        return CoinVM(coins: home[index]).marketVal
    }
    
    func getTotalVolume(_ index: Int) -> Int {
        return CoinVM(coins: home[index]).totalVolume
    }
    
}
