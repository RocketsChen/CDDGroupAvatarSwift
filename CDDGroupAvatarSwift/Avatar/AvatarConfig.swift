//
//  AvatarConfig.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/8.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import Foundation


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
///   - WeChat: 微信
///   - NewQQ:  QQ（以中心点分割的半圆拼接）
///   - OldQQ:  WeiBo（圆拼接）
public enum DCGroupAvatarType: Int {

    case WeChat
    case QQ
    case WeiBo
}



/// 加载图片枚举 * cache
///
/// - Parameters:
///   - SDCGroupAvatarDefaultCached: 默认：走缓存 取到返回 没有则获取最新
///   - SDCGroupAvatarRefreshCached: 先读缓存再获取最新
public enum DCGroupAvatarCacheType: Int {

    case Default
    case Refresh
}

/// 组内头像的数量
///
/// - Parameters:
///  - One: 1
///  - Two: 2
///  - Three: 3
///  - Four: 4 (QQ最大值) / (微博最大值)
///  - Five: 5
///  - Six: 6
///  - Seven: 7
///  - Eight: 8
///  - Nine: 9 (微信最大值)
public enum DCNumberOfGroupAvatarType: Int {

    case One
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    
    
    public func description() -> Int {
        
        switch self {
        case .One:
            return 1
        case .Two:
            return 2
        case .Three:
            return 3
        case .Four:
            return 4
        case .Five:
            return 5
        case .Six:
            return 6
        case .Seven:
            return 7
        case .Eight:
            return 8
        case .Nine:
            return 9
        }
    }
}



// MARK: - Color扩展
extension UIColor {
    
    public static var bgColor: UIColor {
        return .init(red: 238 / 255.0, green: 238 / 255.0, blue: 238 / 255.0, alpha: 1.0)
    }
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

    public static func noCacheIdMD5(_ groupId: String , _ groupSource: [UIImage]) -> String {
        return idMD5(groupId, groupSource)
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


public typealias GroupImageHandler = ((_ groupId: String, _ groupImage: UIImage, _ itemImageArray: [UIImage], _ cacheId: String) -> Void)

public typealias GroupSetImageHandler = (_ setImage: UIImage) -> Void

public typealias GroupImageParamsHandler = () -> Void

public typealias FetchImageHandler = (_ unitImages: [UIImage], _ succeed: Bool) -> Void

public typealias AsynFetchImageHandler = (_ unitImages: [UIImage]) -> Void

public typealias FetchImageParamsHandler = () -> Void


