//
//  CoinCollectionViewCell.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 16.07.2021.
//

import UIKit

class CoinCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var high24hLabel: UILabel!
    @IBOutlet weak var low24hLabel: UILabel!
    @IBOutlet weak var marketValLabel: UILabel!
    @IBOutlet weak var totalVolumeLabel: UILabel!
    @IBOutlet weak var highAllLabel: UILabel!
    @IBOutlet weak var lowAllLabel: UILabel!
    
}
