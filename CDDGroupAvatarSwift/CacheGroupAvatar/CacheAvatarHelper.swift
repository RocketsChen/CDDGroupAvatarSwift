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
    
    
    // MARK: - 获取群头像内部小头像缓存数组
    public static func fetchItemCacheArraySource(_ groupSource: [String]) -> [UIImage] {
        
        var cacheArray = [UIImage]()
        var itemIamge = UIImage()
        
        for item in groupSource {
            itemIamge = ImageCache.default.retrieveImageInMemoryCache(forKey: AvatarConfig.urlStr(item)) ?? AvatarManager.placeholderImage
            cacheArray.append(itemIamge)
        }
        return cacheArray
        
    }
    
 
    // MARK: - 批量加载地址头像
    public static func fetchLoadImageSource(groupSource: [String], groupImage: UIImage, itemPlaceholder: [UIImage]? = nil, completedHandler: FetchImageHandler? = nil) {
        
        var groupImages = Array(repeating: UIImage(), count: groupSource.count)
        var succeed: Bool = false
        
        var groupSum: Int = 0
        var placeholderSum: Int = 0
        
        let callCompletedBlock: GroupImageParamsHandler = {
            if (completedHandler != nil) {
                completedHandler!(groupImages, succeed)
            }
        }
        
        for (index, value) in groupSource.enumerated() {
            
            let url = URL(string: AvatarConfig.urlStr(value))
            guard let downUrl = url else { continue }
            
            let placeholderImage = AvatarManager.placeholderImage.backItemPlaceholderImage(itemPlaceholder, groupSource.count, index)
            placeholderSum = placeholderSum + 1
            groupImages[index] = placeholderImage
            if placeholderSum == groupSource.count {
                callCompletedBlock()
            }
            ImageDownloader.default.downloadImage(with: downUrl, options: nil, progressBlock: nil) { result in
                groupSum = groupSum + 1
                var image = UIImage()
                switch result {
                case .success(let back):
                    image = back.image
                    succeed = true
                    
                case .failure( _):
                    image = placeholderImage
                }
                groupImages[index] = image
                if placeholderSum == groupSource.count {
                    callCompletedBlock()
                }
            }
        }
    }
}
