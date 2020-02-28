//
//  MainController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Hipo Members"
        
        setupMembersController()
        setupButtonsLayer()
    }
    
    fileprivate func setupMembersController() {
        let membersController = MembersController()
        membersController.mainController = self
        
        membersController.view.addFillSuperview(superview: self.view)
        
        self.addChild(membersController)
    }
    
    fileprivate func setupButtonsLayer() {
        let buttonsLayer = HSIALayerButtons()
        buttonsLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonsLayer)
        
        NSLayoutConstraint.activate([
            buttonsLayer.heightAnchor.constraint(equalToConstant: Sizing.twoButtonsLayerHeight),
            buttonsLayer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            buttonsLayer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            buttonsLayer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let sortMembersButton = HSIAButtonRectangle(text: "sort members", type: .primary)
        let addNewMemberButton = HSIAButtonRectangle(text: "add new member", type: .secondary)
        
        buttonsLayer.hstack(
            buttonsLayer.stack(
                sortMembersButton,
                addNewMemberButton, spacing: 16
            ), alignment: .top
        ).withMargins(.init(top: 16, left: 45, bottom: 0, right: 45))
        
    }
    
}