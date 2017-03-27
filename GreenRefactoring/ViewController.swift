//
//  ViewController.swift
//  GreenRefactoring
//
//  Created by DaichiSaito on 2017/03/16.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit
import NCMB
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var request: NiftyRequest?
    
    var items = [NCMBObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let client = NiftyClient()
        client.loadImageData(request: request!) { result in
            switch result {
            case let .success(response):
                self.items = response
                
                self.collectionView.reloadData()
                
            case let .failure(error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! WearImageViewCell
        cell.setCell(with: self.items[indexPath.row])
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
