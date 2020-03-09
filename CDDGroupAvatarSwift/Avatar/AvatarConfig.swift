//
//  AvatarConfig.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

public struct AvatarConfig {
    
    /// 常量方法
    static let DCMaxWeChatCount: Int  = 9
    static let DCMaxQQCount: Int      = 4
    static let DCMaxWeiBoCount: Int   = 4
    
    static let DCMaxWeChatColumn: Int = 3
    
    static let DCDistanceBetweenAvatar: CGFloat = 2
    static let DCWeiBoAvatarbordWidth: CGFloat  = 10

}


/// 头像类型枚举
///
/// - Parameters:
///   - DCGroupAvatarWeChatType: 微信
///   - DCGroupAvatarNewQQType:  QQ（以中心点分割的半圆拼接）
///   - DCGroupAvatarOldQQType:  WeiBo（圆拼接）
public enum DCGroupAvatarType: Int {

    case DCGroupAvatarWeChatType
    case DCGroupAvatarQQType
    case DCGroupAvatarWeiBoType
}



/// 加载图片枚举 * cache
///
/// - Parameters:
///   - SDCGroupAvatarDefaultCached: 默认：走缓存 取到返回 没有则获取最新
///   - SDCGroupAvatarRefreshCached: 先读缓存再获取最新
public enum DCGroupAvatarCacheType: Int {

    case DCGroupAvatarCachedDefault
    case DCGroupAvatarCachedRefresh
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

    public static func noCacheIdMD5(_ groupId: String , _ groupSource: [String]) -> String {
        return idMD5(groupId, groupSource)
    }
    
    
    // MARK: - 私有方法
    private static func idMD5(_ groupId: String , _ groupSource: [String]) -> String {
        let appStrs = "id\(groupId)_num\(groupSource.count)_lastObj\(groupSource.last ?? "")_distance\(AvatarManager.distanceBetweenAvatar)_bordWidth\(AvatarManager.avatarBgColor)_bgColor\(AvatarManager.avatarBgColor)"
        return appStrs.md5 ?? ""
    }

}


