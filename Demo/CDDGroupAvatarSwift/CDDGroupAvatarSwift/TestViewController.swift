//
//  TestViewController.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import Kingfisher


fileprivate enum Reusable {
    
    static let TestCellID = "TestCell"
}


class TestViewController: UITableViewController {
    
    
    // MARK: - LazyLoad
    private lazy var groupArray = [TestItem]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        setUpData()
    }
    
    deinit {
        print("----deinit")
    }
}

// MARK: - 设置 UI 界面
extension TestViewController {
    
    fileprivate func setUpUI() {
        
        view.backgroundColor = .white
        
        AvatarManager.baseUrl = "http://ww1.sinaimg.cn/small/"
        AvatarManager.groupAvatarType = .WeChat
        AvatarManager.placeholderImage = UIImage(named: "avatarholder")!
        
        setupNav()
        setUpTabView()
    }
    
    
    fileprivate func setUpData() {
        
        groupArray.removeAll()
        
        let array: [[String]] = [["006tNc79gy1g5fmoexlt6j30u00vxqrb.jpg", "006tNc79gy1g5fmofi07aj30u00uwqqk.jpg", "006tNc79gy1g5fln5crn5j30u00u00vh.jpg", "006tNc79gy1g5fln52xz8j30u00u0411.jpg", "006tNc79gy1g5fmtvyydxj30u00u0x6r.jpg", "006tNc79gy1g5fmogr9fsj30u00uz4m9.jpg", "006tNc79gy1g5fmogcjidj30u00wc7su.jpg", "006tNc79gy1g5fmofvp9cj30u00w8kft.jpg", "006tNc79gy1g5fmofvp9cj30u00w8kft.jpg"], ["006tNc79gy1g5fln52xz8j30u00u0411.jpg", "006tNc79gy1g5fln5crn5j30u00u00vh.jpg", "006tNc79gy1g5fli2qszgj30ku0ii0ua.jpg", "006tNc79gy1g5fli1g0wtj30rs0rs416.jpg", "006tNc79gy1g5fli2zfzwj30qo0qojvv.jpg", "006tNc79gy1g5fli3fr0oj30u00u2goh.jpg", "006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g56mcmorgrj30rk0nm0ze.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg"], ["006tNc79gy1g57hfrnhe6j30u00w01eu.jpg", "006tNc79gy1g56or92vvmj30u00u048a.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg", "1.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg" ,"1.jpg", "006tNc79gy1g5fli2j5x4j30u00u2ack.jpg", "006tNc79gy1g5fli3fr0oj30u00u2goh.jpg", "006tNc79gy1g57h4j42ppj30u00u00vy.jpg"]];
        
        for i in 0..<24 {
            
            var item = TestItem()
            item.groupId = "群头id-\(i)"
            let index: Int = i / 8
            let count: Int = i % 8
            
            let itemArray = array[index] as NSArray
            let groupSource = itemArray.subarray(with: NSMakeRange(0, min(itemArray.count, count + 2))) as? [String]
            item.groupSource = groupSource
            groupArray.append(item)
        }
        
    }
    
    func setupNav() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "clean", style: .done, target: self, action: #selector(clean))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    
    func setUpTabView() {
        
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.register(TestCell.self, forCellReuseIdentifier: Reusable.TestCellID)
    }
    
    
}


extension TestViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Reusable.TestCellID, for: indexPath) as! TestCell
        
        cell.groupIdLabel.text = groupArray[indexPath.row].groupId
        cell.groupIamgeView.setImageAvatar(groupId: groupArray[indexPath.row].groupId, groupSource:groupArray[indexPath.row].groupSource) { (groupId, groupImage, itemImageArray, cacheId) in
            cell.cacheIdLabel.text = cacheId
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension TestViewController {

    // MARK: - 清理缓存
    @objc func clean() {
        
        ImageCache.default.clearDiskCache()
        ImageCache.default.clearMemoryCache()
        ImageCache.default.cleanExpiredDiskCache { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
    }
}



public struct TestItem {

    var groupId: String!
    var groupSource: [String]!
}


class TestCell: UITableViewCell {
    
    /// Control
    let groupIamgeView = UIImageView()
    let groupIdLabel = UILabel()
    let cacheIdLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpUI() {
        
        contentView.addSubview(groupIamgeView)
        contentView.addSubview(groupIdLabel)
        contentView.addSubview(cacheIdLabel)
        groupIdLabel.font = UIFont.systemFont(ofSize: 18)
        cacheIdLabel.font = UIFont.systemFont(ofSize: 15)
        cacheIdLabel.textColor = .lightGray
        
        groupIamgeView.frame = CGRect(x: 12, y: 10, width: 60, height: 60)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        groupIdLabel.frame = CGRect(x: 82, y: 10, width: self.frame.size.width - 92, height: 30)
        cacheIdLabel.frame = CGRect(x: 82, y: 44, width: self.frame.size.width - 92, height: 20)
    }
    
}
