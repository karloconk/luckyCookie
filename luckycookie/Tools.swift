//
//  Tools.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 16/04/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit
import Foundation

class Tools {
    
    private static var centeredSpinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    
    private static var  spinner : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 75, height: 20))
    
    class func addSpinner(viewController vc: UIViewController) -> UIActivityIndicatorView {
        let centeredSpinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        centeredSpinner.color  = Colors.charcoal
        centeredSpinner.center = vc.view.center
        centeredSpinner.startAnimating()
        vc.view.addSubview(centeredSpinner)
        return centeredSpinner
    }
    
    class func stopSpinner(spinner: UIActivityIndicatorView){
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    class func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {

        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)

        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }

        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!

        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)

        return image
    }
}
