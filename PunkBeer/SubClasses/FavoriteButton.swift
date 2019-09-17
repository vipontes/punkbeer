//
//  FavoriteButton.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//  based on https://www.youtube.com/watch?v=14rwyDsFma8

import Foundation
import UIKit

class FavoriteButton: UIButton {
    
    private var isOn = false
    
    private let favButtonColor = Constants.menuBarColor

    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func setFavorite(bool: Bool) {
        self.isOn = bool
        activateButton(bool: self.isOn)
    }
    
    func getFavorite() -> Bool {
        return self.isOn
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = favButtonColor.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(favButtonColor, for: .normal)
        addTarget(self, action: #selector(FavoriteButton.buttonPressed), for: .touchUpInside)
        
        activateButton(bool: self.isOn)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? favButtonColor : .clear
        let title = bool ? "Favorited" : "Favorite"
        let titleColor = bool ? .white : favButtonColor
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
}
