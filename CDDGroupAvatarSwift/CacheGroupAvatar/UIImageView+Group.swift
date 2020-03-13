//
//  UIImageView+Group.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/11.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    /// 设置群头像
    /// - Parameters:
    ///   - groupId: 群头像id
    ///   - groupSource: 群头像数据源数组
    ///   - itemPlaceholder: 占位图 例：[image1,image2] 权重大于 placeholderImage属性
    ///   - options: 加载图片选项，详情可见DCGroupAvatarCacheType枚举
    ///   - setImageHandler: 绘制好的群头像图片
    ///   - groupImageHandler: _ groupId: String, _ groupImage: UIImage, _ itemImageArray: [UIImage], _ cacheId: String
    public func setImageAvatar(groupId: String, groupSource: [String], itemPlaceholder: [UIImage], options: DCGroupAvatarCacheType? = .Default, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {
        
//        let avatarType = AvatarManager.groupAvatarType
//        let maxSource = AvatarHelper.getTypefMaxCount(groupSource, avatarType)
//        let avatarBgColor = AvatarManager.avatarBgColor
//        let distance = AvatarManager.distanceBetweenAvatar
//        let md5Str = AvatarConfig.cacheIdMD5(groupId, maxSource)
//        let groupImage = ImageCache.default.retrieveImageInMemoryCache(forKey: md5Str)
//        var groupUnitImages = [UIImage]()
        
        
        
    }

}

