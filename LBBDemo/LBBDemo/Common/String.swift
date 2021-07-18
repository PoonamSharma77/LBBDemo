//
//  String.swift
//  LBBDemo
//
//  Created by Poonam Sharma on 18/07/21.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
    @discardableResult func link(_ text: String, font: UIFont) -> NSMutableAttributedString {
    let attributes = [
        NSAttributedString.Key.font: font
        ] as [NSAttributedString.Key: Any]
    let attributedString = NSMutableAttributedString(string: text, attributes: attributes )
    attributedString.addAttribute(.link, value: "", range: NSRange(location: 0, length: text.count))
    append(attributedString)
    return self
}
  @discardableResult func boldString(_ boldText: String, _ normalText: String,font: UIFont) -> NSMutableAttributedString {
//    let boldText = "Filter:"
    let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
    let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)

//    let normalText = "Hi am normal"
    let normalString = NSMutableAttributedString(string:normalText)

    attributedString.append(normalString)
    return attributedString
    }
}
