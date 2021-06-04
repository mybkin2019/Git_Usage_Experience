# typora+upic+腾讯云对象存储 日期 2021-06-04 有效

## 问题

让图片上传到对应的图床中, 在 github 的笔记中显示出来

## 关键原理

1. 图片需要上传到一个云端的服务器, 然后获取到服务器中文件的路径
2. upic 自动上传工具协助快捷完成上传操作
3. 申请腾讯云, 七牛云或者阿里云等云存储服务
4. 让 typora 自动对插入图片进行上传处理

## 解决方案

一共分为三部曲 -> 腾讯云的操作 -> upic 的配置 -> typora 的设置

1. 以腾讯云为例, 先申请腾讯云的账户, 认证之后, 开通对象存储服务, 下图:
2. ![image-20210604234223552](https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604234223552.png)
3. 按照下图流程点击进入存储桶列表, 一个一个存储桶相当于专属的云文件夹, 可以上传你的图片
4. <img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604234413685.png" alt="image-20210604234413685" style="zoom:50%;" />
5. 点击创建存储桶
6. <img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604234450073.png" alt="image-20210604234450073" style="zoom:50%;" />
7. ![image-20210604234614652](https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604234614652.png)
8. 创建完存储桶之后 点击配置管理 获取我们的上传域名 + 地域 对应配置 upic 中出现的 region<img src="template.assets/image-20210604234722870.png" alt="image-20210604234722870" style="zoom:50%;" />
9. 复制我们需要的域名 domain 等下配置 upic 用
10. <img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604234836824.png" alt="image-20210604234836824" style="zoom:50%;" />
11. 右上方用户头像 -> 访问管理 获取我们需要的 secret id, secret key<img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604235724974.png" alt="image-20210604235724974" style="zoom:50%;" />
12. 点击访问秘钥 -> API 秘钥<img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604235821632.png" alt="image-20210604235821632" style="zoom:50%;" />
13. 箭头方向原来会出现一个显示的按钮, 点击扫码获取 key 跟 id, 复制好留着备用<img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210605000355143.png" alt="image-20210605000355143" style="zoom:50%;" />

---

1. 开始下载我们的辅助上传工具 upic, 可以到 app store 或者百度 google 等地方搜索下载 mac 端的upic![image-20210604235025792](https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604235025792.png)
2. 打开软件, mac 端的 upic 会自动在菜单栏, 没有实体的窗口, 右键菜单栏 icon 进入偏好设置 preferences -> host -> 先左下角添加腾讯云, 然后开始配置![image-20210604235224110](https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210604235224110.png)

3. 把我们第一部分从腾讯云中获取到的
   1. region
   2. 存储桶的名字
   3. secret id
   4. Secret key 
   5. domain 端口 -> 访问域名填上去
   6. 点击保存 save

---

1. 设置我们的 typora 里面的图片设置, 先进入 preference 然后按照下图设置
2. <img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210605000642735.png" alt="image-20210605000642735" style="zoom:50%;" />
3. 然后自己开一个 markdown 文件, 尝试插入图片, 看看会不会出现 upload 的标志, 然后上传完毕之后, 图片的路径出现类似url 的东西, 证明上传成功了<img src="https://github-1302794590.cos.ap-hongkong.myqcloud.com/uPic/image-20210605000824029.png" alt="image-20210605000824029" style="zoom:50%;" />

