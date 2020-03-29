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


// MARK: - 方法扩展
extension AvatarConfig {
    
    public static func noCacheIdMD5(_ groupId: String , _ groupSource: [UIImage]) -> String {
        return idMD5(groupId, groupSource)
    }
    
    
    // MARK: - 私有方法
    private static func idMD5(_ groupId: String , _ groupSource: [Any]) -> String {
        
        if groupSource.count == 0 {
            return ""
        }
        
        let appStrs = "id\(groupId)_num\(groupSource.count)_lastObj\(groupSource.last!)_distance\(NoCacheAvatarManager.distanceBetweenAvatar)_bordWidth\(NoCacheAvatarManager.avatarBgColor)_bgColor\(NoCacheAvatarManager.avatarBgColor)"
        return appStrs.md5 ?? ""
    }

}
