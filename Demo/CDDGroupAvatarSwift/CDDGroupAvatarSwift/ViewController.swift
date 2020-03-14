//
//  ViewController.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// WeChat
    @IBOutlet weak var avImageViewW2: UIImageView!
    
    
    /// NoCache
    @IBOutlet weak var ncImageViewW1: UIImageView!
    @IBOutlet weak var ncImageViewW2: UIImageView!
    @IBOutlet weak var ncImageViewW3: UIImageView!
    @IBOutlet weak var ncImageViewW4: UIImageView!
    @IBOutlet weak var ncImageViewW5: UIImageView!
    @IBOutlet weak var ncImageViewW6: UIImageView!
    
    /// Button
    @IBOutlet weak var avaButton: UIButton!
    @IBOutlet weak var avaBgButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        setUpNoCache()
    }
}


// MARK: - 设置 UI 界面
extension ViewController {
    
    fileprivate func setUpUI() {
        
        view.backgroundColor = .white
    
        title = "CDDGroupAvatarSwift"
        
        setUpNoCache()
    }
    
    
    
    func setUpNoCache() {
        
        NoCacheAvatarManager.groupAvatarType = .QQ
        
        
        /// ImageView
        ncImageViewW1.setNoCacheImageAvatar(groupId: "ncImageViewW1", groupSource: [UIImage(named: "noCache1")!])
        ncImageViewW2.setNoCacheImageAvatar(groupId: "ncImageViewW2", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!])

        ncImageViewW3.setNoCacheImageAvatar(groupId: "ncImageViewW3", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!])
        
        ncImageViewW4.setNoCacheImageAvatar(groupId: "ncImageViewW4", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!, UIImage(named: "noCache4")!], setImageHandler: { (img) in
            print(img)
        }) { (groupId, groupImage, itemImageArray, cacheId) in
            print(groupId, groupImage, itemImageArray, cacheId)
        }
        
        ncImageViewW5.setNoCacheImageAvatar(groupId: "ncImageViewW5", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!, UIImage(named: "noCache1")!, UIImage(named: "noCache2")!])
        
        ncImageViewW6.setNoCacheImageAvatar(groupId: "ncImageViewW6", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!, UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!, UIImage(named: "noCache3")!])
        
        
        
        /// Button
        avaButton.setNoCacheImageAvatar(groupId: "ncImageViewW6", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!, UIImage(named: "noCache4")!, UIImage(named: "noCache2")!, UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache1")!], state: .normal, setImageHandler: { (img) in
            print(img)
        }) { (groupId, groupImage, itemImageArray, cacheId) in
            print(groupId, groupImage, itemImageArray, cacheId)
        }
        
        avaBgButton.setNoCacheImageAvatar(groupId: "ncImageViewW6", groupSource: [UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache3")!, UIImage(named: "noCache1")!, UIImage(named: "noCache2")!, UIImage(named: "noCache1")!, UIImage(named: "noCache4")!, UIImage(named: "noCache1")!, UIImage(named: "noCache2")!], state: .normal)
        
    }
}
