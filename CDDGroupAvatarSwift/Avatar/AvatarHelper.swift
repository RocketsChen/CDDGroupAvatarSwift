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
    
    // MARK: - 计算Type_QQ头像尺寸
    public static func calculateSizeQQAvatarGroup(_ groupCount: Int, _ index: Int, _ containerSize: CGSize, _ distance: CGFloat) -> CGSize {
        
        var avatarSize: CGSize = CGSize.zero
        let wholeSize = containerSize
        
        if groupCount == DCNumberOfGroupAvatarType.One.description() {
            avatarSize = wholeSize
            
        }else if groupCount == DCNumberOfGroupAvatarType.Two.description() {
            avatarSize = CGSize(width: (wholeSize.width - distance) / 2, height: wholeSize.height)
            
        }else if groupCount == DCNumberOfGroupAvatarType.Three.description() , index == 0 {
            avatarSize = CGSize(width: (wholeSize.width - distance) / 2, height: wholeSize.height)
            
        }else {
            avatarSize = CGSize(width: (wholeSize.width - distance) / 2, height: (wholeSize.height - distance) / 2)
        }
        
        return avatarSize
    }
    
    
    
    // MARK: - 计算Type_WeChat头像尺寸
    public static func calculateSizeWeChatAvatarGroup(_ groupCount: Int, _ containerSize: CGSize, _ distance: CGFloat) -> CGSize {
        
        var avatarSize: CGSize = CGSize.zero
        let wholeSize = containerSize
    
        if groupCount < DCNumberOfGroupAvatarType.Five.description() {

            avatarSize = CGSize(width: (wholeSize.width - (3 * distance)) / 2, height: (wholeSize.height - (3 * distance)) / 2)
        }else {
            
            avatarSize = CGSize(width: (wholeSize.width - (4 * distance)) / 3, height: (wholeSize.height - (4 * distance)) / 3)
        }
        
        return avatarSize
    }
    
    
    // MARK: - 计算TypeWeiBo头像尺寸
    public static func calculateRadiusWeiBoAvatarGroup(_ groupCount: Int, _ containerSize: CGSize, _ distance: CGFloat) -> CGFloat {

        let bigRadius: CGFloat = containerSize.width / 2
        var radius: CGFloat = 0
        
        switch groupCount {
            
            case DCNumberOfGroupAvatarType.One.description():
                radius = bigRadius
            
            case DCNumberOfGroupAvatarType.Two.description():
                radius =  bigRadius / 2 + (distance / 2)
            
            case DCNumberOfGroupAvatarType.Three.description():
                radius = (2 * sqrt(3) - 3) * bigRadius + (distance / 3)
            
            case DCNumberOfGroupAvatarType.Four.description():
                radius = bigRadius / 2 - (distance / 2)
            
            default:
                radius = 0
        }

        return radius
    }
    
    
    // MARK: - 计算Type_WeiBo小头像位置
    public static func calculateWeiBoAvatarGroupCount(groupCount: Int, index: Int, containerSize: CGSize, distance: CGFloat) -> CGPoint {

        var avatarPoint = CGPoint.zero
        var avatarDiameter: CGFloat = calculateRadiusWeiBoAvatarGroup(groupCount, containerSize, distance)
        var radiusOffset: CGFloat = 0
        let bigRadius: CGFloat = containerSize.width / 2
        let shrinkage: CGFloat = groupCount == DCNumberOfGroupAvatarType.Four.description() ? distance : -2 * distance
        let indexFloat = CGFloat(index)
        let groupCountFloat = CGFloat(groupCount)
        let piFloat = CGFloat(Double.pi)

        if (groupCount == DCNumberOfGroupAvatarType.One.description()) {

            avatarPoint = CGPoint(x: containerSize.width * 0.5, y: containerSize.height * 0.5)

        } else if (groupCount == DCNumberOfGroupAvatarType.Three.description()) {

            let difference: CGFloat = (bigRadius - avatarDiameter)

            if (index == 1) {

                avatarDiameter = avatarDiameter - shrinkage
                avatarPoint = CGPoint(x: bigRadius, y: avatarDiameter + distance)

            }else{

                avatarDiameter = avatarDiameter + shrinkage
                radiusOffset = indexFloat * -0.5 * piFloat
                let pX: CGFloat = avatarDiameter * CGFloat(cosf(Float(radiusOffset)))
                avatarPoint = CGPoint(x: bigRadius + pX, y: bigRadius + (difference / 2) + distance)
            }

        }else{

            avatarDiameter = avatarDiameter + shrinkage
            radiusOffset = -0.75 * piFloat

            let content: Float = Float(2 * piFloat * indexFloat / groupCountFloat + radiusOffset)
            let pX: CGFloat = avatarDiameter * CGFloat(cosf(content))
            let pY: CGFloat = avatarDiameter * CGFloat(sinf(content))
            avatarPoint = CGPoint(x: bigRadius + pX, y: bigRadius + pY)
        }

        return avatarPoint
    }
    
    // MARK: - 计算Type_WeChat/QQ小头像位置
    public static func calculateWeiBoAvatarGroupCount(groupCount: Int, index: Int, containerSize: CGSize, distance: CGFloat, avatarType: DCGroupAvatarType) -> CGPoint {
        
        var avatarPoint = CGPoint.zero
        
        let wcSize: CGSize = calculateSizeWeChatAvatarGroup(groupCount, containerSize, distance)
        let qqSize: CGSize = calculateSizeQQAvatarGroup(groupCount, index, containerSize, distance)
        let avatarSize: CGSize = (avatarType == .DCGroupAvatarWeChatType) ? wcSize : qqSize
        
        var currentIndex = index
        let avaWidth = avatarSize.width
        let avaHeight = avatarSize.height
        let currentIndexFloat = CGFloat(currentIndex)
        var row: CGFloat = 0
        var column: CGFloat = 0
        let maxWeiChatCount = CGFloat(AvatarConfig.DCMaxWeChatColumn)
        
        switch groupCount {
            case DCNumberOfGroupAvatarType.One.description():
                if avatarType == .DCGroupAvatarWeChatType {
                    avatarPoint = CGPoint(x: (containerSize.width - avaWidth)  * 0.5, y: (containerSize.height - avaHeight) * 0.5)
                }
            case DCNumberOfGroupAvatarType.Two.description():
            
                if avatarType == .DCGroupAvatarWeChatType {
                    
                    avatarPoint = CGPoint(x: currentIndexFloat * (avaWidth + distance) + distance, y: (containerSize.height - avaHeight) / 2)
                }else if avatarType == .DCGroupAvatarQQType {
                    
                    avatarPoint = CGPoint(x: currentIndexFloat * (avaWidth + distance), y: 0)
                }
            
            case DCNumberOfGroupAvatarType.Three.description():
                
                if avatarType == .DCGroupAvatarWeChatType {
                    
                    if currentIndex == 0 {
                        avatarPoint = CGPoint(x: (containerSize.width - avaWidth) / 2, y: distance)
                    }else {

                        avatarPoint = CGPoint(x: (currentIndexFloat - 1) * (avaWidth + distance) + distance, y: avaHeight + 2 * distance)
                    }
                    
                }else if avatarType == .DCGroupAvatarQQType {
                    
                    if currentIndex == 0 {
                        avatarPoint = CGPoint(x: 0, y: 0);
                    }else {
                        if currentIndex == 2 {
                            currentIndex = currentIndex + 1
                        }
                        column = CGFloat(currentIndex / 2)
                        avatarPoint = CGPoint(x: avaWidth + distance, y: column * (avaHeight + distance))
                    }
                }
            
            case DCNumberOfGroupAvatarType.Four.description():
                
                column = currentIndexFloat / 2
                row = currentIndexFloat - (column *  2)
                
                if avatarType == .DCGroupAvatarWeChatType {
                    
                    avatarPoint = CGPoint(x: row * (avaWidth + distance) + distance, y: column * (avaHeight + distance) + distance)
                }else if avatarType == .DCGroupAvatarQQType {
                    
                    avatarPoint = CGPoint(x: row * (avaWidth + distance), y: column * (avaHeight + distance))
                }
            
            case DCNumberOfGroupAvatarType.Five.description():
                
                if avatarType == .DCGroupAvatarWeChatType {
                    
                    let tempPoint = CGPoint(x: (containerSize.width -  distance - (2 * avaWidth)) / 2, y: (containerSize.height -  distance - (2 * avaHeight)) / 2)
                    if currentIndex <= 1 {
                        avatarPoint = CGPoint(x: currentIndexFloat * (distance + avaWidth) + tempPoint.x , y: tempPoint.y)
                        
                    }else {
                        avatarPoint = CGPoint(x: (currentIndexFloat - 2) * (avaWidth + distance) + distance, y: tempPoint.y + avaHeight + distance)
                    }
                }
            
            case DCNumberOfGroupAvatarType.Six.description():
                
                let tempPointY: CGFloat = (containerSize.height -  distance - (2 * avaHeight)) / 2
                
                if avatarType == .DCGroupAvatarWeChatType {
                    column = currentIndexFloat / CGFloat(AvatarConfig.DCMaxWeChatColumn)
                    row = currentIndexFloat - CGFloat((column *  maxWeiChatCount))
                    avatarPoint = CGPoint(x: row * (avaWidth + distance) + distance, y: column * (avaHeight + distance) + tempPointY)
                }
            
            case DCNumberOfGroupAvatarType.Seven.description():
                if avatarType == .DCGroupAvatarWeChatType {
                    
                    if currentIndex == 0 {
                        
                        avatarPoint = CGPoint(x: (containerSize.width - avaWidth) / 2, y: distance)
                    }else {

                        column = currentIndexFloat / CGFloat(AvatarConfig.DCMaxWeChatColumn)
                        row = currentIndexFloat - CGFloat((column *  maxWeiChatCount))
                        avatarPoint = CGPoint(x: row * (avaWidth + distance) + distance, y: column * (avaHeight + distance) + distance)
                    }
                }
            
                
            case DCNumberOfGroupAvatarType.Eight.description():
                if avatarType == .DCGroupAvatarWeChatType {
                    
                    if currentIndex < 2 {
                        let tempPointX = (containerSize.width - 2 * avaWidth - distance) / 2
                        avatarPoint = CGPoint(x: currentIndexFloat * (avaWidth + distance) + tempPointX, y: distance)
                    }else {
                        column = (currentIndexFloat + 1)  / maxWeiChatCount
                        row = (currentIndexFloat + 1) - CGFloat((column *  maxWeiChatCount))
                        avatarPoint = CGPoint(x: row * (avaWidth + distance) + distance, y: column * (avaHeight + distance) + distance)
                    }
                }
            
            case DCNumberOfGroupAvatarType.Nine.description():
                if avatarType == .DCGroupAvatarWeChatType {
                    column = currentIndexFloat / maxWeiChatCount
                    row = currentIndexFloat - CGFloat((column *  maxWeiChatCount))
                    avatarPoint = CGPoint(x: row * (avaWidth + distance) + distance, y: column * (avaHeight + distance) + distance)
                }
            default:
                break
            }
        return avatarPoint
    }
    
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
