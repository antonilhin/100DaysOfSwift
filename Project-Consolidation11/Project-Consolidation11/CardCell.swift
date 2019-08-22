//
//  CardCell.swift
//  Project-Consolidation11
//
//  Created by Antoni on 22/08/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet var hiddenImageView: UIImageView!
    @IBOutlet var coverImageView: UIImageView!
    
    var name: String?
    
    var isFliped = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 15.0
    }
    
    @objc func flip() {
        isFliped = !isFliped
        if isFliped {
            UIView.transition(with: self.contentView, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
                self.coverImageView.isHidden = true
                self.hiddenImageView.isHidden = false
            }, completion: nil)
        } else {
            UIView.transition(with: self.contentView, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
                self.coverImageView.isHidden = false
                self.hiddenImageView.isHidden = true
            }, completion: nil)
        }
    }
    
}
