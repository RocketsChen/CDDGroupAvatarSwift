//
//  UIButton+NoCacheGroup.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/11.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

extension UIButton {

    public func setNoCacheImageAvatar(groupId: String, groupSource: [UIImage], state: UIControl.State, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {
        
        var groupImage = UIImage()

        let maxSource: [UIImage] = AvatarHelper.getTypefMaxCount(groupSource, NoCacheAvatarManager.groupAvatarType)

        let handler: GroupImageParamsHandler = {
            if setImageHandler != nil {
                setImageHandler!(groupImage)
            }
            if groupImageHandler != nil {
                groupImageHandler!(groupId, groupImage, maxSource, AvatarConfig.noCacheIdMD5(groupId, maxSource))
            }
        }

        let containerSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        groupImage = UIImage.getGroupImage(maxSource, containerSize)
        self.setImage(groupImage, for: state)

        handler() // block

    }
    
    
    public func setNoCacheBackgroundAvatar(groupId: String, groupSource: [UIImage], state: UIControl.State, setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {

        var groupImage = UIImage()

        let maxSource: [UIImage] = AvatarHelper.getTypefMaxCount(groupSource, NoCacheAvatarManager.groupAvatarType)

        let handler: GroupImageParamsHandler = {
            if setImageHandler != nil {
                setImageHandler!(groupImage)
            }
            if groupImageHandler != nil {
                groupImageHandler!(groupId, groupImage, maxSource, AvatarConfig.noCacheIdMD5(groupId, maxSource))
            }
        }

        let containerSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        groupImage = UIImage.getGroupImage(maxSource, containerSize)
        self.setBackgroundImage(groupImage, for: state)

        handler() // block
    }
    
    
}

