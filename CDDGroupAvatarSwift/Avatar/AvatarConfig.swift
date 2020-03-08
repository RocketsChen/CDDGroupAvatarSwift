//
//  AvatarConfig.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

struct AvatarConfig {
    
    /// 常量方法
    struct Metric {

        static let DCMaxWeChatCount  = 9
        static let DCMaxQQCount      = 4
        static let DCMaxWeiBoCount   = 4
        
        static let DCMaxWeChatColumn = 3
        
        static let DCDistanceBetweenAvatar = 2
        static let DCWeiBoAvatarbordWidth  = 10
    }
    

    /// 头像类型枚举
    ///
    /// - Parameters:
    ///   - DCGroupAvatarWeChatType: 微信
    ///   - DCGroupAvatarNewQQType:  QQ（以中心点分割的半圆拼接）
    ///   - DCGroupAvatarOldQQType:  WeiBo（圆拼接）
    enum DCGroupAvatarType: Int {

        case DCGroupAvatarWeChatType
        case DCGroupAvatarQQType
        case DCGroupAvatarWeiBoType
    }
    
    

    /// 加载图片枚举 * cache
    ///
    /// - Parameters:
    ///   - SDCGroupAvatarDefaultCached: 默认：走缓存 取到返回 没有则获取最新
    ///   - SDCGroupAvatarRefreshCached: 先读缓存再获取最新
    enum DCGroupAvatarCacheType: Int {

        case DCGroupAvatarCachedDefault
        case DCGroupAvatarCachedRefresh
    }
    

}


// MARK: - 方法扩展
extension AvatarConfig {
    
    public static func urlStr(_ avaStr: String) -> String {
        return avaStr.contains("www.") ? avaStr : "\("")\(avaStr)"
    }

    public static func cacheIdMD5(_ groupId: String , _ groupSource: String) -> String {
        idMD5(groupId, groupSource)
    }

    public static func noCacheIdMD5(_ groupId: String , _ groupSource: String) -> String {
        return idMD5(groupId, groupSource)
    }
    
    
    // MARK: - 私有方法
    private static func idMD5(_ groupId: String , _ groupSource: String) -> String {
        return "id\(1)_num\(1)_lastObj\(1)_distance\(1)_bordWidth\(1)_bgColor\(1)"
    }

}

