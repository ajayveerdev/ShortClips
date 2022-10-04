//
//  CustomExtensions.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import Foundation
import Kingfisher

extension Date {
    
    func convertDateToString(actualFormat: String, expectedFormat: String) -> String? {
        let simpleDateFormat = DateFormatter()
        simpleDateFormat.dateFormat = actualFormat
        simpleDateFormat.timeZone = NSTimeZone.local
        simpleDateFormat.amSymbol = "am"
        simpleDateFormat.pmSymbol = "am"
        let str = simpleDateFormat.string(from: self)
        if str.count > 0 {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = expectedFormat //format return
            dateFormat.timeZone = NSTimeZone.local
            dateFormat.amSymbol = "am"
            dateFormat.pmSymbol = "am"
            if let date = simpleDateFormat.date(from: str) {
                let dateStr = dateFormat.string(from: date)
                return dateStr
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
}

extension String {
    func convertStringToDate(actualFormat: String, expectedFormat: String) -> Date? {
        let simpleDateFormat = DateFormatter()
        simpleDateFormat.dateFormat = actualFormat //format our date String
        simpleDateFormat.timeZone = NSTimeZone.local
        simpleDateFormat.amSymbol = "am"
        simpleDateFormat.pmSymbol = "am"
        if let date = simpleDateFormat.date(from: self) {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = expectedFormat //format return
            dateFormat.timeZone = NSTimeZone.local
            dateFormat.amSymbol = "am"
            dateFormat.pmSymbol = "am"
            let datestring = dateFormat.string(from: date)
            if datestring.count > 0 {
                return dateFormat.date(from: datestring)
            } else {
                return Date()
            }
        }
        
        return Date()
    }
}


extension UIImageView{
    func downloadImage(url: Resource?,view: UIView) {
        self.kf.setImage(with: url,
                         placeholder: nil,
                         options: [.transition(.fade(0.3)),
                                   .cacheOriginalImage,
                                   .forceTransition]) { (_, _) in
                                       
                                   } completionHandler: { (_) in
                                       if let imgPlace = view.subviews.first(where: { $0.layer.name == "placeholder" }) {
                                           imgPlace.isHidden = true
                                       }
                                   }
    }
}
