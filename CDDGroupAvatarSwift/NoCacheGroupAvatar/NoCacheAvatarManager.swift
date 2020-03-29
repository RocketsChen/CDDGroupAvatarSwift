//
//  NoCacheAvatarManager.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/11.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

public struct NoCacheAvatarManager {
    
    /// 头像类型枚举(默认微信样式)
    public static var groupAvatarType: DCGroupAvatarType = .WeChat
    
    /// 微博外边圈宽度（默认：10）
    public static var bordWidth: CGFloat = AvatarConfig.DCWeiBoAvatarbordWidth
    
    /// 微信和QQ群内小头像间距（默认值：2）
    public static var distanceBetweenAvatar: CGFloat = AvatarConfig.DCDistanceBetweenAvatar
    
    /// 头像背景(默认微信背景色)
    public static var avatarBgColor: UIColor = UIColor.bgColor

}
