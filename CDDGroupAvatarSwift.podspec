Pod::Spec.new do |s|
s.name         = 'CDDGroupAvatarSwift'
s.version      = '1.2.4'
s.summary      = 'iOS 群头像 / Easy to use'

s.description  = <<-DESC
iOS 群头像功能，像加载一张图片那么简单。
DESC

s.homepage     = 'https://github.com/RocketsChen/CDDGroupAvatarSwift'
s.license      = 'MIT'  #开源协议
s.authors      = {'RcoketsChen' => '1062749739@qq.com'}
s.platform     = :ios, '9.0'
s.source       = {:git => 'https://github.com/RocketsChen/CDDGroupAvatarSwift.git', :tag => s.version}
s.requires_arc     = true
s.frameworks       = 'UIKit', 'Foundation'
s.default_subspec  = 'Cache'

    s.subspec 'NoCache' do |ss|
    
      ss.source_files = 'CDDGroupAvatarSwift/Avatar/*.swift' , 'CDDGroupAvatarSwift/NoCacheGroupAvatar/*.swift'
      
    end
    
    
    s.subspec 'Cache' do |ss|
    
      ss.source_files = 'CDDGroupAvatarSwift/Avatar/*.swift' , 'CDDGroupAvatarSwift/CacheGroupAvatar/*.swift'
      s.dependency 'Kingfisher'
      
    end
    
    
    s.subspec 'Core' do |ss|
    
      ss.source_files = 'CDDGroupAvatarSwift/Avatar/*.swift' , 'CDDGroupAvatarSwift/NoCacheGroupAvatar/*.swift' , 'CDDGroupAvatarSwift/CacheGroupAvatar/*.swift'
      s.dependency 'Kingfisher'
      
    end
    
end

