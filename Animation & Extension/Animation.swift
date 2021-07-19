//
//  Animation.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 17.07.2021.
//

import Foundation
import UIKit

class Animation {
    
    func blurImage(image:UIImage) -> UIImage? {
        let context = CIContext(options: nil)
        let inputImage = CIImage(image: image)
        let originalOrientation = image.imageOrientation
        let originalScale = image.scale
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(5.0, forKey: kCIInputRadiusKey)
        let outputImage = filter?.outputImage
        var cgImage:CGImage?
        
        if let asd = outputImage
        {
            cgImage = context.createCGImage(asd, from: (inputImage?.extent)!)
        }
        
        if let cgImageA = cgImage
        {
            return UIImage(cgImage: cgImageA, scale: originalScale, orientation: originalOrientation)
        }
        return nil
    }
    
    
     func animateAll(view: [UIView], X: Int, Y: Int, durat: Double = 1, damping: Double = 0.8){
        
        for i in view {
            let animateView = i
            
            animateView.transform = CGAffineTransform(translationX: CGFloat(X), y: CGFloat(Y))
            UIView.animate(withDuration: durat, delay: 0.0, usingSpringWithDamping: CGFloat(damping), initialSpringVelocity: 0, options: [], animations: {
                animateView.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
        
    }
        
}
