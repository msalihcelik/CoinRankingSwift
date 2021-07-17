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
    
    
    func animateAll(view: [UIView]){
        
        for i in view {
            let animateView = i
            
            animateView.transform = CGAffineTransform(translationX: 500, y: 0)
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                animateView.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
        
    }
    
    
    func animateAll2(view: [UIView]){
        for i in view {
            let animateView = i
            
            animateView.transform = CGAffineTransform(translationX: 0, y: 500)
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                animateView.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
    }
    
    
    func animateAll3(view: [UITableViewCell]){
        for i in view {
            let animateView = i
            
            animateView.transform = CGAffineTransform(translationX: 0, y: 500)
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
                
                animateView.transform = CGAffineTransform(translationX: 0, y: 0);
                
            }, completion: nil)
        }
    }
    
}
