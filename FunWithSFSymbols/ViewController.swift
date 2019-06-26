//
//  ViewController.swift
//  FunWithSFSymbols
//
//  Created by Antonio Strijdom on 20/06/2019.
//  Copyright © 2019 Antonio Strijdom. All rights reserved.
//

import UIKit

func line(withText text: String, symbol: String, centered: Bool = true) -> UIView {
    let container = UIView()
    container.translatesAutoresizingMaskIntoConstraints = false
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(label)
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(imageView)
    let leadingConstraint = imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: container.leadingAnchor, multiplier: 1.0)
    leadingConstraint.priority = .defaultHigh
    container.addConstraint(leadingConstraint)
    container.addConstraint(imageView.widthAnchor.constraint(equalToConstant: 44.0))
    if centered {
        container.addConstraint(imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor))
    } else {
        container.addConstraint(imageView.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor))
    }
    let imageLabelConstraint = label.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1.0)
    imageLabelConstraint.priority = .defaultHigh
    container.addConstraint(imageLabelConstraint)
    container.addConstraint(label.centerYAnchor.constraint(equalTo: container.centerYAnchor))
    container.addConstraint(container.heightAnchor.constraint(equalTo: label.heightAnchor))
    container.addConstraint(label.trailingAnchor.constraint(equalTo: container.trailingAnchor))
    
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.text = text
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = .label
    label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .body)
    imageView.image = UIImage(systemName: symbol)
    imageView.tintColor = .label
    imageView.contentMode = .center
    imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    
    return container
}

func singleLineView() -> UIView {
    return line(withText: "Hello World", symbol: "hand.raised")
}

func centeredMultiLineView() -> UIView {
    return line(withText: "Don't mind me, I'm just going to keep writing this until I fill two lines.", symbol: "text.aligncenter")
}

func multiLineView() -> UIView {
    return line(withText: "This line is also pretty long, so it will wrap onto two lines. But check out where the icon is! ", symbol: "arrow.up.circle", centered: false)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let single = singleLineView()
        view.addSubview(single)
        view.addConstraint(single.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor))
        view.addConstraint(single.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor))
        view.addConstraint(single.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor))
        single.backgroundColor = .systemBackground
        let centered = centeredMultiLineView()
        view.addSubview(centered)
        view.addConstraint(centered.topAnchor.constraint(equalToSystemSpacingBelow: single.bottomAnchor, multiplier: 1.0))
        view.addConstraint(centered.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor))
        view.addConstraint(centered.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor))
        single.backgroundColor = .secondarySystemBackground
        let multi = multiLineView()
        view.addSubview(multi)
        view.addConstraint(multi.topAnchor.constraint(equalToSystemSpacingBelow: centered.bottomAnchor, multiplier: 1.0))
        view.addConstraint(multi.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor))
        view.addConstraint(multi.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor))
        multi.backgroundColor = .tertiarySystemBackground
        
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .center
        backgroundImage.image = UIImage(named: "image")
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.addConstraint(backgroundImage.topAnchor.constraint(equalTo: multi.bottomAnchor))
        view.addConstraint(backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        view.addConstraint(backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor))
        view.addConstraint(backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor))
        
        let blur = UIBlurEffect(style: .regular)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(effectView)
        view.addConstraint(effectView.topAnchor.constraint(equalTo: backgroundImage.topAnchor))
        view.addConstraint(effectView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor))
        view.addConstraint(effectView.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor))
        view.addConstraint(effectView.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor))
//
//        view.addSubview(effectView)
//        view.addConstraint(effectView.topAnchor.constraint(equalTo: multi.bottomAnchor))
//        view.addConstraint(effectView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
//        view.addConstraint(effectView.leftAnchor.constraint(equalTo: view.leftAnchor))
//        view.addConstraint(effectView.rightAnchor.constraint(equalTo: view.rightAnchor))
    }
}

