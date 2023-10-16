//
//  ViewController.swift
//  ExVisibleRect
//
//  Created by 김종권 on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {
    private let containerView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let contentView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    private let orangeView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containerView)
        view.addSubview(contentView)
        view.addSubview(orangeView)
        
        containerView.frame = .init(x: 50, y: 80, width: 300, height: 300)
        contentView.frame = .init(x: 100, y: 100, width: 150, height: 150)
        orangeView.frame = .init(x: 100, y: 350, width: 200, height: 300)
        
        print(containerView.frame.intersects(orangeView.frame)) // true
        print(containerView.frame.contains(orangeView.frame)) // false
        print(containerView.frame.contains(contentView.frame)) // true
    }
}

extension UIView {
    var visible: Bool {
        guard window != nil else { return false }
        let viewFrame = convert(bounds, to: nil)
        let screenBounds = UIScreen.main.bounds
        return viewFrame.intersects(screenBounds)
    }
    
    var fullyVisible: Bool {
        guard window != nil else { return false }
        let viewFrame = convert(bounds, to: nil)
        let screenBounds = UIScreen.main.bounds
        return screenBounds.contains(viewFrame)
    }
}
