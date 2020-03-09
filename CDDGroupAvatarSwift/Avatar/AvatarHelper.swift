//
//  AvatarHelper.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/9.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import CommonCrypto



struct AvatarHelper {
    
  
    // MARK: - 获取群头像最大数组数量
    public static func getTypefMaxCount(_ groupSource: [String], groupAvatarType: DCGroupAvatarType) -> [String] {
        
        var newSource = [String]()
        var count: Int
        switch groupAvatarType {
            
            case .DCGroupAvatarWeChatType:
                count = AvatarConfig.DCMaxWeChatCount
            
            case .DCGroupAvatarQQType:
                count = AvatarConfig.DCMaxQQCount
            
            case .DCGroupAvatarWeiBoType:
                count = AvatarConfig.DCMaxWeiBoCount
        }
        
        for i in 0...min(count, groupSource.count) {
            newSource.append(groupSource[i])
        }
        return newSource
    }
    
}


extension AvatarHelper {
    
}




extension String {
    
    var md5: String? {
        
       let str = self.cString(using: String.Encoding.utf8)
       let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
       let digestLen = Int(CC_MD5_DIGEST_LENGTH)
       let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
       CC_MD5(str!, strLen, result)
       let hash = NSMutableString()
       for i in 0 ..< digestLen {
           hash.appendFormat("%02x", result[i])
       }
       free(result)
       return String(format: hash as String)
    }
}



extension UIColor {
     
    // MARK: - 颜色转字符串
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
         
        let multiplier = CGFloat(255.999999)
         
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
         
        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
        else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }
}
