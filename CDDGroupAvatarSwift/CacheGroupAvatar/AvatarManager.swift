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
    public static var placeholderImage: UIImage = UIImage()
    
    /// 头像类型枚举(默认微信样式)
    public static var groupAvatarType: DCGroupAvatarType = .WeChat
    
    /// 微博外边圈宽度（默认：10）
    public static var bordWidth: CGFloat = AvatarConfig.DCWeiBoAvatarbordWidth
    
    /// 微信和QQ群内小头像间距（默认值：2）
    public static var distanceBetweenAvatar: CGFloat = AvatarConfig.DCDistanceBetweenAvatar
    
    /// 头像背景(默认微信背景色)
    public static var avatarBgColor: UIColor = UIColor.bgColor

}



// MARK: - 方法扩展
extension AvatarConfig {
    
    public static func urlStr(_ avaStr: String) -> String {
        
        guard let baseUrl = AvatarManager.baseUrl else {
            return avaStr
        }
        
        return avaStr.contains("www.") ? avaStr : "\(baseUrl)\(avaStr)"
    }
    
    
    public static func cacheIdMD5(_ groupId: String , _ groupSource: [String]) -> String {
        idMD5(groupId, groupSource)
    }

    
    // MARK: - 私有方法
    private static func idMD5(_ groupId: String , _ groupSource: [Any]) -> String {
        
        if groupSource.count == 0 {
            return ""
        }
        
        let appStrs = "id\(groupId)_num\(groupSource.count)_lastObj\(groupSource.last!)_distance\(AvatarManager.distanceBetweenAvatar)_bordWidth\(AvatarManager.avatarBgColor)_bgColor\(AvatarManager.avatarBgColor)"
        return appStrs.md5 ?? ""
    }

}
