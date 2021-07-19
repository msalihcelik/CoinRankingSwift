//
//  ViewController.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 16.07.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    @IBOutlet weak var coinCV: UICollectionView!
    @IBOutlet weak var coinTB: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var homeVM: HomeVM!
    var filteredData: [String]!
    var filteredPrice: [Double]!
    var filteredImage: [String]!
    var nameData = [String]()
    var priceData = [Double]()
    var imageData = [String]()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinCV.delegate = self
        coinCV.dataSource = self
        coinTB.delegate = self
        coinTB.dataSource = self
        self.coinTB.separatorStyle = .none
        getData()
        searchBar.searchTextField.layer.cornerRadius = 19
        searchBar.searchTextField.clipsToBounds = true
        searchBar.clipsToBounds = true
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.filteredData == nil {
            return 0
        }
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinTVC", for: indexPath) as! CoinTableViewCell
        cell.coinImage.downloaded(from: URL(string: self.filteredImage[indexPath.row])!, contentMode: .scaleAspectFit, blur: false)
        cell.coinNameLabel.text = filteredData[indexPath.row]
        cell.coinPriceLabel.text = "$" + String(round(self.filteredPrice[indexPath.row]*1000000)/1000000)
        Animation().animateAll(view: [cell], X: 0, Y: 500, durat: 0.5, damping: 1)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.homeVM == nil {
            return 0
        }
        return self.homeVM.numOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coinCVC", for: indexPath) as! CoinCollectionViewCell
        cell.coinImage.downloaded(from: URL(string: self.homeVM.getIconUrl(indexPath.row)!)!, contentMode: .scaleAspectFit, blur: true)
        cell.nameLabel.text = self.homeVM.getCoinName(indexPath.row)
        cell.rankLabel.text = "Rank: #" + String(self.homeVM.getRank(indexPath.row))
        cell.high24hLabel.text = "24h high: $" + String(self.homeVM.getHigh24h(indexPath.row))
        cell.low24hLabel.text = "24h low: $" + String(self.homeVM.getLow24h(indexPath.row))
        cell.lowAllLabel.text = "Low: $" + String(self.homeVM.getLowAll(indexPath.row))
        cell.highAllLabel.text = "High: $" + String(self.homeVM.getHighAll(indexPath.row))
        cell.marketValLabel.text = "Market cap: $" + String(self.homeVM.getMarketVal(indexPath.row))
        cell.totalVolumeLabel.text = "Total volume: $" + String(self.homeVM.getTotalVolume(indexPath.row))
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        filteredImage = []
        filteredPrice = []
        if self.homeVM != nil {
            if searchText == "" {
                self.filteredData = self.nameData
                self.filteredImage = self.imageData
                self.filteredPrice = self.priceData
            } else {
                for fruit in self.homeVM.home {
                    if fruit.name.lowercased().contains(searchText.lowercased()) {
                        self.filteredImage.append(fruit.image)
                        self.filteredPrice.append(fruit.currentPrice)
                        self.filteredData.append(fruit.name)
                    }
                }
            }
            self.coinTB.reloadData()
        }
    }
    
    func getData() {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
        Webservice().downloadModel(url: url) { (data) in
            if let data = data {
                self.homeVM = HomeVM(home: data)
                for i in data {
                    self.imageData.append(i.image)
                    self.priceData.append(i.currentPrice)
                    self.nameData.append(i.name)
                }
                
                DispatchQueue.main.async {
                    Animation().animateAll(view: [self.coinCV], X: 500, Y: 0)
                    Animation().animateAll(view: [self.coinTB], X: 0, Y: 500)
                    self.filteredImage = self.imageData
                    self.filteredPrice = self.priceData
                    self.filteredData = self.nameData
                    self.coinTB.reloadData()
                    self.coinCV.reloadData()
                }
                
            }
        }
    }
    
    
}



