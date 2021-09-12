//
//  BlueView.swift
//  setNeedsLayout & layoutIfNeeded & layoutSubviews
//
//  Created by Sinan on 12.09.2021.
//

import UIKit

class BlueView: UIView {

    override init(frame : CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.shadowOffset = CGSize(width: 8, height: 8)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10
        self.clipsToBounds = false
    }

}
