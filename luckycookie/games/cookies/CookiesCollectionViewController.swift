//
//  CookiesCollectionViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado  on 12/05/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class CookiesCollectionViewController: UICollectionViewController {
    
    // MARK:- UICollectionViewDataSource


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK:- UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        imageview.image = UIImage(named: "basic_closed")
        return cell
    }

}
