//
//  BookViewController.swift
//  BookStoreApp
//
//  Created by Smita Kankayya on 27/03/24.
//

import UIKit

class BookViewController: UIViewController {
    
    @IBOutlet var bookCollectionView: UICollectionView!
    
    var bookStore = BookStoreDM(books: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerWithXIBCollectionView()
        initializeCollectionView()
        jsonParsingUsingDecoder()
    }
    
    func registerWithXIBCollectionView(){
        let uiNib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        self.bookCollectionView.register(uiNib, forCellWithReuseIdentifier: "BookCollectionViewCell")
    }
    
    func initializeCollectionView(){
        bookCollectionView.dataSource = self
        bookCollectionView.delegate = self
    }
    
    func jsonParsingUsingDecoder(){
        let url = URL(string: "https://api.itbook.store/1.0/new")
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let jsonDecoder = JSONDecoder()
            self.bookStore = try! jsonDecoder.decode(BookStoreDM.self, from: data!)
            print(self.bookStore)
            
            DispatchQueue.main.async {
                self.bookCollectionView.reloadData()
            }
        }
        dataTask.resume()
    }
    
}

extension BookViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookStore.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bookCollectionViewCell = self.bookCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell
        bookCollectionViewCell?.bookImageView.kf.setImage(with: URL(string: bookStore.books[indexPath.row].image ))
        bookCollectionViewCell?.isbnLabel.text = ("isbn : \(String(describing: bookStore.books[indexPath.row].isbn13))")
        bookCollectionViewCell?.priceLabel.text = ("Price : \(String(describing: bookStore.books[indexPath.row].price))")
        return bookCollectionViewCell!
    }
}

extension BookViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let bookDetailsViewController = self.storyboard?.instantiateViewController(identifier: "BookDetailsViewController") as? BookDetailsViewController
        bookDetailsViewController?.bookContainer = bookStore.books[indexPath.row]
        navigationController?.pushViewController(bookDetailsViewController!, animated: true)
    }
}

extension BookViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spacebetweenTheCell : CGFloat = (flowLayout.minimumInteritemSpacing ) + (flowLayout.sectionInset.left )
        + (flowLayout.sectionInset.right )
        let size = (self.bookCollectionView.frame.width - spacebetweenTheCell)/2.0
        return CGSize(width: size, height: size)
    }
}
