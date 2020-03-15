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

    public func setImageAvatar(groupId: String, groupSource: [String], itemPlaceholder: [UIImage]? = nil, state: UIControl.State, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {
        
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
        
        CacheAvatarHelper.fetchLoadImageSource(groupSource: groupSource, groupImage: groupImage, itemPlaceholder: itemPlaceholder) {[weak self] (unitImages, succeed) in
            
            guard let self = self else { return }
            
            groupUnitImages = unitImages
            let containerSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
            groupImage = UIImage.cacheGroupImage(groupUnitImages, containerSize, avatarType)
            
            self.setImage(groupImage, for: state)
            handler() // block
        }

    }
    
    
    public func setBackgroundAvatar(groupId: String, groupSource: [String], itemPlaceholder: [UIImage]? = nil, state: UIControl.State, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {

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
        
        CacheAvatarHelper.fetchLoadImageSource(groupSource: groupSource, groupImage: groupImage, itemPlaceholder: itemPlaceholder) {[weak self] (unitImages, succeed) in
            
            guard let self = self else { return }
            
            groupUnitImages = unitImages
            let containerSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
            groupImage = UIImage.cacheGroupImage(groupUnitImages, containerSize, avatarType)
            
            self.setBackgroundImage(groupImage, for: state)
            handler() // block
        }
    }
    
}
