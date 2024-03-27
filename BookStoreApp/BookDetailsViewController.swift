//
//  BookDetailsViewController.swift
//  BookStoreApp
//
//  Created by Smita Kankayya on 27/03/24.
//

import UIKit
import Kingfisher

class BookDetailsViewController: UIViewController {
    
    @IBOutlet var BookImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var isbnLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var urlLabel: UILabel!
    
    var bookContainer : Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            bindData()
    }

    func  bindData(){
        BookImage.kf.setImage(with: URL(string: (bookContainer?.image)!))
        self.titleLabel.text = ("Title : \(bookContainer!.title)")
        self.subtitleLabel.text = ("Subtitle : \(bookContainer!.subtitle)")
        self.isbnLabel.text = ("Isbn : \(bookContainer!.isbn13)")
        self.priceLabel.text = ("Price : \(bookContainer!.price)")
        self.urlLabel.text = ("Url : \(bookContainer!.url)")
    }

}
