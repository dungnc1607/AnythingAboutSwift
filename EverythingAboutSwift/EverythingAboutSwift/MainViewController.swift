//
//  MainViewController.swift
//  EverythingAboutSwift
//
//  Created by Squall on 10/5/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainStackView:UIStackView = UIStackView()
    var childStackView:UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        self.autolayoutStackView()
        self.autolayoutStackViewChild()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainStackView.changeStackViewColor(color: .gray)
        childStackView.changeStackViewColor(color: .cyan)
    }
    
    private func autolayoutStackView(){
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false //set = false mới thay đổi layout = code đc
        //Set anchor cho thằng cha
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true //Auto layout tương thích iphone, ipad
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        mainStackView.axis =  .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        mainStackView.backgroundColor = UIColor.gray
    }
    
    private func autolayoutStackViewChild(){
        mainStackView.addArrangedSubview(childStackView)
        childStackView.translatesAutoresizingMaskIntoConstraints = false //set = false mới thay đổi layout = code đc
        //Set Anchor cho thằng con
        childStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
