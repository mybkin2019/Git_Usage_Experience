# 本地 github 账户切换 2021-06-03 有效

## 问题

切换 mac 上的 github 绑定终端的用户

`fatal: unable to access 'https://github.com/..你需要 push 的..git/': The requested URL returned error: 403`

这个问题发生在, 我用朋友的身份 push 到仓库之后, 想切换回来我自己 github 的身份, 却已经无法 push 我自己的远程仓库

## 关键原理

macOS 里面自己给终端绑定了一个钥匙串 keychain 我们需要到系统里面自行删除, 然后重新登录自己的 github 到终端里绑定

## 解决方案

1. 打开应用 KeyChain Access 
2. 搜索钥匙 git
3. 找到 github 关联的钥匙
4. 删除对应的钥匙
5. 重新 push 本地 repo, 然后会出现重新登录要求输入的用户密码

