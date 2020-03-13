//
//  CacheAvatarHelper.swift
//  CDDGroupAvatarSwift
//
//  Created by 陈甸甸 on 2020/3/11.
//  Copyright © 2020 RocketsChen. All rights reserved.
//

import UIKit
import Kingfisher


public struct CacheAvatarHelper {
    
    
    /// 获取群头像内部小头像缓存数组
    /// - Parameter groupSource: 数据源
    public static func fetchItemCacheArraySource(_ groupSource: [String]) -> [UIImage] {
        
        var cacheArray = [UIImage]()
        var itemIamge = UIImage()
        
        for item in groupSource {
            itemIamge = ImageCache.default.retrieveImageInMemoryCache(forKey: AvatarConfig.urlStr(item)) ?? AvatarManager.placeholderImage.image!
            cacheArray.append(itemIamge)
        }
        return cacheArray
        
    }
    
    
    public static func fetchLoadImageSource(groupSource: [String], groupImage: UIImage, itemPlaceholder: [UIImage], completedHandler: FetchImageHandler? = nil) {
        
        var groupImages = [UIImage]()
        var succeed: Bool = false
        
        let callCompletedBlock: GroupImageParamsHandler = {
            if (completedHandler != nil) {
                completedHandler!(groupImages, succeed)
            }
            
        }
        
        for item in groupSource {
            
            let url = URL(string: AvatarConfig.urlStr(item))
            guard let downUrl = url else { continue }
            
            
        }
        
        
    }
    

}
