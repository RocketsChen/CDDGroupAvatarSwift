//
//  UIImageView+NoCacheGroup.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/11.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

extension UIImageView {

    /// 设置群头像
    /// - Parameters:
    ///   - groupId: 群头像id
    ///   - groupSource: 群头像数据源数组
    ///   - setImageHandler: 绘制好的群头像图片
    ///   - groupImageHandler: (_ groupId: String, _ groupImage: UIImage, _ itemImageArray: [UIImage], _ cacheId: String)
    public func setNoCacheImageAvatar(groupId: String, groupSource: [UIImage], setImageHandler: GroupSetImageHandler? = nil, groupImageHandler: GroupImageHandler? = nil) {
        
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
        self.image = groupImage
        
        handler() // block
        
    }

    
}