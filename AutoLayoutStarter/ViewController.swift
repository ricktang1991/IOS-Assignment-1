//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
    
    let purpleBox: UIView = {
        let pb = UIView(frame: CGRect.zero)
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.backgroundColor = .purple
        return pb
    }()
    
    let blueBox1: UIView = {
        let b1 = UIView()
        b1.translatesAutoresizingMaskIntoConstraints = false
        b1.backgroundColor = .blue
        return b1
    }()
    
    let blueBox2: UIView = {
        let b2 = UIView()
        b2.translatesAutoresizingMaskIntoConstraints = false
        b2.backgroundColor = .blue
        return b2
    }()
    
    let blueBox3: UIView = {
        let b3 = UIView()
        b3.translatesAutoresizingMaskIntoConstraints = false
        b3.backgroundColor = .blue
        return b3
    }()
    
    let orangeBox1: UIView = {
        let o1 = UIView()
        o1.translatesAutoresizingMaskIntoConstraints = false
        o1.backgroundColor = .orange
        return o1
    }()
    
    let orangeBox2: UIView = {
        let o2 = UIView()
        o2.translatesAutoresizingMaskIntoConstraints = false
        o2.backgroundColor = .orange
        return o2
    }()
    
    let redBox: UIView = {
       let rb = UIView()
        rb.translatesAutoresizingMaskIntoConstraints = false
        rb.backgroundColor = .red
        return rb
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    mainView.addSubview(purpleBox)
    mainView.addSubview(redBox)
    
    redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
    redBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
    redBox.widthAnchor.constraint(equalToConstant: 180).isActive = true
    redBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    purpleBox.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 250).isActive = true
    purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
    purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
    purpleBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    blueBox1.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox1.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox2.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox3.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueBox3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    let vStackView = UIStackView(arrangedSubviews: [blueBox1, blueBox2, blueBox3])
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.axis = .vertical
    vStackView.distribution = .equalSpacing
    vStackView.alignment = .center
    mainView.addSubview(vStackView)
    vStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    vStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 80).isActive = true
    vStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -80).isActive = true
    
    orangeBox1.widthAnchor.constraint(equalToConstant: 90).isActive = true
    orangeBox1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    orangeBox2.widthAnchor.constraint(equalToConstant: 60).isActive = true
    orangeBox2.heightAnchor.constraint(equalToConstant: 30).isActive = true

    let hStackView = UIStackView(arrangedSubviews: [orangeBox1, orangeBox2])
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.axis = .horizontal
    hStackView.alignment = .center
    hStackView.distribution = .equalSpacing
    redBox.addSubview(hStackView)
    hStackView.topAnchor.constraint(equalTo: redBox.topAnchor).isActive = true
    hStackView.bottomAnchor.constraint(equalTo: redBox.bottomAnchor).isActive = true
    hStackView.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 10).isActive = true
    hStackView.trailingAnchor.constraint(equalTo: redBox.trailingAnchor, constant: -10).isActive = true
    
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

