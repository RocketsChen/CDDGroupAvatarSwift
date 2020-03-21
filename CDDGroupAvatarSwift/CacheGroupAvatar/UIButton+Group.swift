//
//  UIButton+Group.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/11.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import Kingfisher

extension UIButton {

    /// 设置群头像【Image】
    /// - Parameters:
    ///   - groupId: 群头像id
    ///   - groupSource: 群头像数据源数组
    ///   - state: 状态
    ///   - options: 加载图片选项，详情可见DCGroupAvatarCacheType枚举
    ///   - setImageHandler: 绘制好的群头像图片
    ///   - groupImageHandler: (_ groupId: String, _ groupImage: UIImage, _ itemImageArray: [UIImage], _ cacheId: String)
    public func setImageAvatar(groupId: String, groupSource: [String], itemPlaceholder: [UIImage]? = nil, state: UIControl.State, options: DCGroupAvatarCacheType? = .Default, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {
        
        let avatarType = AvatarManager.groupAvatarType
        let maxSource = AvatarHelper.getTypefMaxCount(groupSource, avatarType)
        let md5Str = AvatarConfig.cacheIdMD5(groupId, maxSource)
        
        var groupImage = ImageCache.default.retrieveImageInMemoryCache(forKey: md5Str) ?? AvatarManager.placeholderImage
        var groupUnitImages = [UIImage]()

        let handler: GroupImageParamsHandler = {
            if setImageHandler != nil {
                setImageHandler!(groupImage)
            }
            if groupImageHandler != nil {
                groupImageHandler!(groupId, groupImage, groupUnitImages, AvatarConfig.cacheIdMD5(groupId, maxSource))
            }
        }
        
        if let image = ImageCache.default.retrieveImageInMemoryCache(forKey: md5Str) {
            groupImage = image
            self.setImage(groupImage, for: state)
            if options == .Default {
                groupUnitImages = CacheAvatarHelper.fetchItemCacheArraySource(groupSource)
                handler()
                if groupUnitImages.count == groupSource.count { return }
            }
        }
        
        let isCached = ImageCache.default.isCached(forKey: md5Str)
        CacheAvatarHelper.fetchLoadImageSource(groupSource: groupSource, cacheGroupImage: !isCached ? nil : groupImage, itemPlaceholder: itemPlaceholder) {[weak self] (unitImages, succeed) in
            guard let self = self else { return }
            
            groupUnitImages = unitImages
            let containerSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
            groupImage = UIImage.cacheGroupImage(groupUnitImages, containerSize, avatarType)
            
            self.setImage(groupImage, for: state)
            ImageCache.default.store(groupImage, forKey: md5Str, toDisk: true)
            
            handler() // block
        }

    }
    
    
    /// 设置群头像【BackgroundImage】
    /// - Parameters:
    ///   - groupId: 群头像id
    ///   - groupSource: 群头像数据源数组
    ///   - state: 状态
    ///   - options: 加载图片选项，详情可见DCGroupAvatarCacheType枚举
    ///   - setImageHandler: 绘制好的群头像图片
    ///   - groupImageHandler: (_ groupId: String, _ groupImage: UIImage, _ itemImageArray: [UIImage], _ cacheId: String)
    public func setBackgroundAvatar(groupId: String, groupSource: [String], itemPlaceholder: [UIImage]? = nil, state: UIControl.State, options: DCGroupAvatarCacheType? = .Default, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {

        let avatarType = AvatarManager.groupAvatarType
        let maxSource = AvatarHelper.getTypefMaxCount(groupSource, avatarType)
        let md5Str = AvatarConfig.cacheIdMD5(groupId, maxSource)
        
        var groupImage = ImageCache.default.retrieveImageInMemoryCache(forKey: md5Str) ?? AvatarManager.placeholderImage
        var groupUnitImages = [UIImage]()

        let handler: GroupImageParamsHandler = {
            if setImageHandler != nil {
                setImageHandler!(groupImage)
            }
            if groupImageHandler != nil {
                groupImageHandler!(groupId, groupImage, groupUnitImages, AvatarConfig.cacheIdMD5(groupId, maxSource))
            }
        }

        if let image = ImageCache.default.retrieveImageInMemoryCache(forKey: md5Str) {
            groupImage = image
            self.setBackgroundImage(groupImage, for: state)
            if options == .Default {
                groupUnitImages = CacheAvatarHelper.fetchItemCacheArraySource(groupSource)
                handler()
                if groupUnitImages.count == groupSource.count { return }
            }
        }
        
        let isCached = ImageCache.default.isCached(forKey: md5Str)
        CacheAvatarHelper.fetchLoadImageSource(groupSource: groupSource, cacheGroupImage: !isCached ? nil : groupImage, itemPlaceholder: itemPlaceholder) {[weak self] (unitImages, succeed) in
            guard let self = self else { return }
            
            groupUnitImages = unitImages
            let containerSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
            groupImage = UIImage.cacheGroupImage(groupUnitImages, containerSize, avatarType)
            
            self.setBackgroundImage(groupImage, for: state)
            ImageCache.default.store(groupImage, forKey: md5Str, toDisk: true)
            
            handler() // block
        }
    }
    
}
