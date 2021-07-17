//
//  Extension.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 17.07.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, blur: Bool) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                if blur == true {
                    self?.image = Animation().blurImage(image: image)
                } else {
                    self?.image = image
                }
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit, blur: Bool = false) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, blur: blur)
    }
}
