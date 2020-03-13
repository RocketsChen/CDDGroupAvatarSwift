//
//  TestViewController.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    // MARK: - LazyLoad
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
}

// MARK: - 设置 UI 界面
extension TestViewController {
    
    fileprivate func setUpUI() {
        
        view.backgroundColor = .white
    }
}
