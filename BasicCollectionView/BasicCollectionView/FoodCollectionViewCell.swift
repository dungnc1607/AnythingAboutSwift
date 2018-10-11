//
//  FoodCollectionViewCell.swift
//  BasicCollectionView
//
//  Created by Squall on 10/8/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    var stackView:UIStackView = UIStackView()
    var imageView:UIImageView = UIImageView()
    var labelFoodname:UILabel = UILabel()
    var labelDescription:UILabel = UILabel()
    
    func autoLayoutCell(){
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //auto-layout image
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2.0/3.0).isActive = true
        
        //auto-layout label
        labelFoodname.translatesAutoresizingMaskIntoConstraints = false
        labelFoodname.text = "Food name"
        labelFoodname.font = UIFont.boldSystemFont(ofSize: 15)
        stackView.addArrangedSubview(labelFoodname)
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.text = "Food Description"
        labelDescription.font = UIFont.systemFont(ofSize: 15)
        stackView.addArrangedSubview(labelDescription)
        
        //stackview setting
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
    }
    
    var food: Food! {
        didSet{
//            imageView.image = UIImage(named: food.imageName!)
            labelFoodname.text = food.foodName ?? ""
            labelDescription.text = food.foodDescription ?? ""
            
        }
    }
    
    var url: imageURL!{
        didSet{
            print(url.url!)
            imageView.getImageFromURL(urlString: url.url!)
        }
    }
    
}
