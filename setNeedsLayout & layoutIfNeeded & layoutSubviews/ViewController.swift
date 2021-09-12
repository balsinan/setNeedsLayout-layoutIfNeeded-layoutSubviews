//
//  ViewController.swift
//  setNeedsLayout & layoutIfNeeded & layoutSubviews
//
//  Created by Sinan on 12.09.2021.
//

import UIKit

class ViewController: UIViewController {

    let animateButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.tintColor = .white
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        return button
    }()
    
    let redView  = BlueView()
    
    var redViewHeight : NSLayoutConstraint?
    var redViewWidth : NSLayoutConstraint?
    
    var redViewCenterX: NSLayoutConstraint?
    var redViewCenterY: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
    func setupView() {
        view.addSubview(redView)
        view.addSubview(animateButton)
        animateButton.frame = CGRect(x: (self.view.frame.width - 200)/2, y: (self.view.frame.height - 155), width: 200, height: 55)
    }
    
    func setupLayout() {
        redViewCenterX = redView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        redViewCenterX?.isActive = true
        redViewCenterY = redView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
        redViewCenterY?.isActive = true
        redViewWidth = redView.widthAnchor.constraint(equalToConstant: 150)
        redViewWidth?.isActive = true
        redViewHeight = redView.heightAnchor.constraint(equalToConstant: 150)
        redViewHeight?.isActive = true
    }
    
    @objc func startAnimation(){
        
        self.redViewCenterY?.constant = redViewCenterY?.constant == -200 ? 150 : -200
        self.redViewWidth?.constant = redViewWidth?.constant == 150 ? 250 : 150
        self.redViewHeight?.constant = redViewHeight?.constant == 150 ? 250 : 150
        
        UIView.animate(withDuration: 2.0) {
            self.view.layoutIfNeeded()
            //self.view.setNeedsLayout()
        }
    }
}

