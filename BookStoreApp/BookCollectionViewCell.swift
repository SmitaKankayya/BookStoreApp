//
//  BookCollectionViewCell.swift
//  BookStoreApp
//
//  Created by Smita Kankayya on 27/03/24.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var isbnLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
