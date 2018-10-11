//
//  MainViewController.swift
//  BasicCollectionView
//
//  Created by Squall on 10/8/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var collectionView: UICollectionView?
    let cellID = "cell"
    let cellSpacing:CGFloat = 10
    var foods:[Food] = foodData
    var urls:[imageURL] = foodDataURL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.backgroundColor = .white
        
        //collection view setting
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing) //Tạo khoảng cách với 2 bên 10 pixel
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionView?.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}

extension MainViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FoodCollectionViewCell
//        cell.backgroundColor =  .cyan 
//        cell.selectedBackgroundView = UIView() //Tạo 1 UIView cho cell đc chọn rồi mới đổi màu
//        cell.selectedBackgroundView?.backgroundColor = .gray
        cell.autoLayoutCell()
        cell.food = foods[indexPath.row]
        cell.url = urls[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 3 * cellSpacing)/2 // chia 2 cột thì có 3 khoảng ko (leading - spacing - trailing) * 10 pixel mỗi khoảng
        let height = width
        return CGSize(width: width, height: height)
    }
}
