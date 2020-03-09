//
//  AvatarManager.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/9.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

public struct AvatarManager {
    
    
    /// 请求的baseURL。这应该只包含URL的共体部分，例如'http://www.example.com'。
    public static var baseUrl: String?
    
    /// 一次性设置小头像加载失败的占位图 ： 权重低于类方法中的placeholder属性 placeholderImage < (id)placeholder
    public static var placeholderImage: UIImageView?
    
    /// 头像类型枚举(默认微信样式)
    public static var groupAvatarType: DCGroupAvatarType = .DCGroupAvatarWeiBoType
    
    /// 微博外边圈宽度（默认：10）
    public static var bordWidth: CGFloat = AvatarConfig.DCWeiBoAvatarbordWidth
    
    /// 微信和QQ群内小头像间距（默认值：2）
    public static var distanceBetweenAvatar: CGFloat = AvatarConfig.DCDistanceBetweenAvatar
    
    
    /// 头像背景(默认微信背景色)
    public static var avatarBgColor: UIColor = .init(red: 238 / 255.0, green: 238 / 255.0, blue: 238 / 255.0, alpha: 1.0)

}
