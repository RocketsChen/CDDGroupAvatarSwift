//
//  ViewController.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    /// WeChat
    @IBOutlet weak var avImageViewW2: UIImageView!
    @IBOutlet weak var avImageViewW3: UIImageView!
    @IBOutlet weak var avImageViewW4: UIImageView!
    @IBOutlet weak var avImageViewW5: UIImageView!
    @IBOutlet weak var avImageViewW6: UIImageView!
    @IBOutlet weak var avImageViewW7: UIImageView!
    @IBOutlet weak var avImageViewW8: UIImageView!
    @IBOutlet weak var avImageViewW9: UIImageView!
    
    
    // QQ
    @IBOutlet weak var avImageViewNQ2: UIImageView!
    @IBOutlet weak var avImageViewNQ3: UIImageView!
    @IBOutlet weak var avImageViewNQ4: UIImageView!
    
    // WeBo
    @IBOutlet weak var avImageViewWeiBo2: UIImageView!
    @IBOutlet weak var avImageViewWeiBo3: UIImageView!
    @IBOutlet weak var avImageViewWeiBo4: UIImageView!
    
    
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
    
}


// MARK: - 设置 UI 界面
extension ViewController {
    
    fileprivate func setUpUI() {
        
        view.backgroundColor = .white
    
        title = "CDDGroupAvatarSwift"
        
        setUpLoadData()
    }
    
    
    func setupNav() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "table", style: .done, target: self, action: #selector(goToTest))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "clean", style: .done, target: self, action: #selector(clean))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    
    func setUpLoadData() {
        
        setupNav()
        
        setUpCache()
        
        setUpNoCache()
    }

}


extension ViewController {

    func setUpCache() {
        
        AvatarManager.baseUrl = "http://ww1.sinaimg.cn/small/"
        AvatarManager.placeholderImage = UIImage(named: "avatarholder")!

        setUpWeiChatCache()
        setUpNewQQCache()
        setUpWeiBoCache()
        
    }
    
    
    // MARK: - WeiChat
    func setUpWeiChatCache() {
        
        AvatarManager.groupAvatarType = .WeChat
        
        avImageViewW2.setImageAvatar(groupId: "avImageViewW2", groupSource: ["1","2"], itemPlaceholder: [UIImage(named: "man")!, UIImage(named: "woman")!])
        avImageViewW3.setImageAvatar(groupId: "avImageViewW3", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg"])
        avImageViewW4.setImageAvatar(groupId: "avImageViewW4", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57hfrnhe6j30u00w01eu.jpg"])
        avImageViewW5.setImageAvatar(groupId: "avImageViewW5", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g57hfrnhe6j30u00w01eu.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg"])
        avImageViewW6.setImageAvatar(groupId: "avImageViewW6", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g57hfrnhe6j30u00w01eu.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg"])
        avImageViewW7.setImageAvatar(groupId: "avImageViewW7", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g57hfrnhe6j30u00w01eu.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg"])
        avImageViewW8.setImageAvatar(groupId: "avImageViewW8", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g57hfrnhe6j30u00w01eu.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg"])
        avImageViewW9.setImageAvatar(groupId: "avImageViewW9", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g57hfrnhe6j30u00w01eu.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g56or92vvmj30u00u048a.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg","006tNc79gy1g57h4j42ppj30u00u00vy.jpg"])
        
    }
    

    // MARK: - NewQQ
    func setUpNewQQCache() {
        
        AvatarManager.groupAvatarType = .QQ
        
        avImageViewNQ2.setImageAvatar(groupId: "avImageViewNQ2", groupSource: ["1","2"], itemPlaceholder: [UIImage(named: "man")!, UIImage(named: "woman")!])
        avImageViewNQ3.setImageAvatar(groupId: "avImageViewNQ3", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg"])
        avImageViewNQ4.setImageAvatar(groupId: "avImageViewNQ4", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57hfrnhe6j30u00w01eu.jpg"])
    }
    

    // MARK: - WeiBo
    func setUpWeiBoCache() {
        
        AvatarManager.groupAvatarType = .WeiBo
        
        avImageViewWeiBo2.setImageAvatar(groupId: "avImageViewWeiBo2", groupSource: ["1","2"], itemPlaceholder: [UIImage(named: "man")!, UIImage(named: "woman")!])
        avImageViewWeiBo3.setImageAvatar(groupId: "avImageViewWeiBo3", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg"])
        avImageViewWeiBo4.setImageAvatar(groupId: "avImageViewWeiBo4", groupSource: ["006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "006tNc79gy1g57hfrnhe6j30u00w01eu.jpg"])
    }
    
}


extension ViewController {
    
    // MARK: - 无缓存版本
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



extension ViewController {
    
    
    // MARK: - tableView测试
    @objc func goToTest() {
        
        navigationController?.pushViewController(TestViewController(), animated: true)
    }

    // MARK: - 清理缓存
    @objc func clean() {
        
        ImageCache.default.clearDiskCache()
        ImageCache.default.clearMemoryCache()
        setUpLoadData()
    }
}
