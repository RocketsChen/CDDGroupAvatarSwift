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
        for item in groupSource {
            
            if let itemIamge = Kingfisher.ImageCache.default.retrieveImageInMemoryCache(forKey: AvatarConfig.urlStr(item)) {
                cacheArray.append(itemIamge)
            }
        }
        return cacheArray
        
    }
    
 
    // MARK: - 批量加载地址头像
    public static func fetchLoadImageSource(groupSource: [String], cacheGroupImage: UIImage? = nil, itemPlaceholder: [UIImage]? = nil, completedHandler: FetchImageHandler? = nil) {
        
        var groupImages = Array(repeating: UIImage(), count: groupSource.count)
        var succeed: Bool = false
        
        var groupSum: Int = 0
        var placeholderSum: Int = 0
        
        let callCompletedBlock: GroupImageParamsHandler = {
            DispatchQueue.main.async {
                if (completedHandler != nil) {
                    completedHandler!(groupImages, succeed)
                }
            }
        }
        
        for (index, value) in groupSource.enumerated() {
            
            let url = URL(string: AvatarConfig.urlStr(value))
            guard let downUrl = url else { continue }
            
            let placeholderImage = AvatarManager.placeholderImage.backItemPlaceholderImage(itemPlaceholder, groupSource.count, index)
            if cacheGroupImage == nil {
                placeholderSum = placeholderSum + 1
                groupImages[index] = placeholderImage
                if placeholderSum == groupSource.count {
                    callCompletedBlock()
                }
            }
            Kingfisher.ImageDownloader.default.downloadImage(with: downUrl, options: nil, progressBlock: nil) { result in
                groupSum = groupSum + 1
                var image = UIImage()
                switch result {
                case .success(let back):
                    image = back.image
                    succeed = true
                    Kingfisher.ImageCache.default.store(image, forKey: AvatarConfig.urlStr(value), toDisk: true)
                    
                case .failure( _):
                    image = placeholderImage
                }
                groupImages[index] = image
                if groupSum == groupSource.count {
                    callCompletedBlock()
                }
            }
        }
    }
}



extension CacheAvatarHelper {
    
    
    /// 异步批量加载头像
    /// - Parameters:
    ///   - groupSource: 数据源
    ///   - itemPlaceholder: 占位图
    ///   - completedHandler: 返回加载的图像和是否成功的tag
    public static func asynfetchLoadImageSource(_ groupSource: [String], _ itemPlaceholder: [UIImage]? = nil, _ completedHandler: AsynFetchImageHandler? = nil) {
        
        fetchLoadImageSource(groupSource: groupSource, cacheGroupImage: nil, itemPlaceholder: itemPlaceholder) { (unitImages, succeed) in
            if completedHandler != nil , succeed == true {
                completedHandler!(unitImages)
            }
        }
    }
    
}
