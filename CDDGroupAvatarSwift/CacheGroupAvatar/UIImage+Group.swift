//
//  UIImage+Group.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/15.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 拼接群头像
    /// - Parameters:
    ///   - maxSource: 数据源
    ///   - size: 大小
    public static func cacheGroupImage(_ maxSource: [UIImage], _ size: CGSize, _ avatarType: DCGroupAvatarType) -> UIImage {
    
        let avatarBgColor = AvatarManager.avatarBgColor
        let distance = AvatarManager.distanceBetweenAvatar
        
        var groupImage = UIImage()
        
        var itemAvaSize: CGSize = CGSize.zero
        var itemAvaPoint: CGPoint = CGPoint.zero
        let containerSize = CGSize(width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(containerSize, false, UIScreen.main.scale)
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.setFillColor(avatarBgColor.cgColor)
        ctx.fill(CGRect(x: 0, y: 0, width: containerSize.width, height: containerSize.height))
        
        if avatarType != .WeiBo { // WeChat 、QQ
            
            if avatarType == .WeChat {
                itemAvaSize = AvatarHelperTool.calculateSizeWeChatAvatarGroup(maxSource.count, containerSize, distance)
            }
            
            for (index, value) in maxSource.enumerated() {
                
                if avatarType == .QQ {
                    itemAvaSize = AvatarHelperTool.calculateSizeQQAvatarGroup(maxSource.count, index, containerSize, distance)
                }
                
                var avatarImage: UIImage = value
                if itemAvaSize.height != itemAvaSize.width { // 当时不是1:1的时候需要裁减  默认是以中心和长的一边为准裁取短的
                    let loginEdge: CGFloat = max(itemAvaSize.height, itemAvaSize.width)
                    let shortEdge: CGFloat = min(itemAvaSize.height, itemAvaSize.width)
                    avatarImage = avatarImage.cutImageView(CGSize(width: loginEdge, height: loginEdge), CGRect(x: (loginEdge - shortEdge) * 0.5, y: 0, width: shortEdge, height: loginEdge))
                }
                
                itemAvaPoint = AvatarHelperTool.calculatePointAvatarGroup(maxSource.count, index, containerSize, distance, avatarType)
                let avaRect: CGRect = CGRect(x: itemAvaPoint.x, y: itemAvaPoint.y, width: itemAvaSize.width, height: itemAvaSize.height)
                avatarImage .draw(in: avaRect)
            }
            
        }else { // WeiBo
            
            let bordWidth: CGFloat = NoCacheAvatarManager.bordWidth
            let radius: CGFloat = AvatarHelperTool.calculateRadiusWeiBoAvatarGroup(maxSource.count, containerSize, distance)
            
            for (index, value) in maxSource.enumerated() {
                
                let avatarImage = value.cgContextAddArcToPointImage(bordWidth, avatarBgColor)
                ctx.saveGState()
                itemAvaPoint = AvatarHelperTool.calculateWeiBoAvatarGroup(maxSource.count, index, containerSize, distance)
                ctx.addArc(center: CGPoint(x: itemAvaPoint.x, y: itemAvaPoint.y), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
                ctx.closePath()
                ctx.clip()
                let avatarRect: CGRect = CGRect(x: itemAvaPoint.x - radius, y: itemAvaPoint.y - radius, width: radius * 2, height: radius * 2)
                avatarImage.draw(in: avatarRect)
                ctx.restoreGState()
            }
            
        }
        
        groupImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        if (avatarType == .QQ) {
            groupImage = groupImage.cgContextAddArcToPointImage(0, .clear)
        }
        
        return groupImage
    }
    
}
