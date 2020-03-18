# CDDGroupAvatarSwift

#### 这框架的初衷是想使群头像的实现尽可能的能像加载一张图片那么简单

![GIF](https://github.com/RocketsChen/CDDGroupAvatarSwift/blob/master/CDDGroupAvatarSwift.gif)

#### OC版本：

[OC版本传送门](https://github.com/RocketsChen/CDDGroupAvatar)

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
| 1.0.0 | 初步完成基本需求| 



#### 关于版本：

目前`iOS`和`Swift`版本均已开源，后续会继续优化完善~

欢迎 Star✨


#### Agreement

* ` CDDGroupAvatarSwift` licensed under the MIT license is used. Refer to [LICENSE](https://opensource.org/licenses/MIT) for more information.


