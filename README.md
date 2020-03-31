# CDDGroupAvatarSwift

#### 这框架的初衷是想使群头像的实现尽可能的能像加载一张图片那么简单

![GIF](https://github.com/RocketsChen/CDDGroupAvatarSwift/blob/master/CDDGroupAvatarSwift.gif)

#### OC版本：

[OC版本传送门](https://github.com/RocketsChen/CDDGroupAvatar)

#### 安装：

<del> * CocoaPods

1：在 Podfile 中添加 pod '`CDDGroupAvatarSwift`'，执行 pod install 或 pod update。

   * 如果只需要无缓存版本：pod '`CDDGroupAvatarSwift/NoCache`，更多详情可以查看podspec文件

</del>

* 手动导入

1：将demo项目中的 `CDDGroupAvatarSwift` 文件夹所有内容拖入你的工程中。
2：集成 Kingfisher 框架。

* 用法

1：导入`import CDDGroupAvatarSwift`可以拥有全部功能。
2：调用对应控件的类方法。
3：如果有使用上的疑问，可以下载演示demo进行查看。

#### 代码：

##### 缓存版本： 默认依赖`Kingfisher`

```
// UIImageView
avImageViewW3.setImageAvatar(groupId: "avImageViewW3", groupSource: groupNum3)

// UIButton
// Image
avaBgButton.setImageAvatar(groupId: "avaBgButtonImage", groupSource: groupNum9, state: .normal)
// Background
avaBgButton.setBackgroundAvatar(groupId: "avaBgButtonBgImage", groupSource: groupNum9, state: .normal)
```

##### 纯UI版本： 

```
// UIImageView
ncImageViewW1.setNoCacheImageAvatar(groupId: "ncImageViewW1", groupSource: [UIImage(named: "noCache1")!])

// UIButton
// Image
avaBgButton.setNoCacheImageAvatar(groupId: "avaBgButtonImage", groupSource: [UIImage(named: "noCache1")!], state: .normal)
// Background
avaBgButton.setNoCacheBackgroundAvatar(groupId: "avaBgButtonBgImage", groupSource: [UIImage(named: "noCache1")!], state: .normal)
```

## 版本更新

| version | note |
| ------ | ------ | 
| 1.1.0 | 初步完成基本需求| 



#### 关于版本：

目前`iOS`和`Swift`版本均已开源，后续会继续优化完善~

欢迎 Star✨


#### Agreement

* ` CDDGroupAvatarSwift` licensed under the MIT license is used. Refer to [LICENSE](https://opensource.org/licenses/MIT) for more information.


