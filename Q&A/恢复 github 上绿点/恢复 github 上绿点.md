# Github 上恢复绿点的问题 2021-06-03 有效

## 背景

本地提交了代码之后, Github 上面没有变绿

## 关键原理

本地默认的 gitconfig 里面的 user.name 跟 user.email 跟着一块提交上去了 github, 但是 github 没有按照提交上去的 user email 跟 user name 找到对应 github 上的用户, 所以弄不清楚到底是哪个用户提交了代码, 所以不会出现 commit 跟绿点

## 解决方案

see: 

- https://blog.csdn.net/yusufolu9/article/details/53706269 -> 恢复绿点方法
- https://juejin.cn/post/6844903987448283144 -> 修改文件执行权限

1. 本地更新 git config 里的 user name & email, 避免下次提交重现, 一共有两种修改

   1. 修改全局的 git config -> 

      ```shell
      git config --global user.name "你 github 上的用户名, 登录用户名?"
      git config --global user.email "你 github 上的邮箱, 可以点击头像 -> settings -> emails 找到"
      ```

   2. 修改当前 repo 的

      ```shell
      # 关键命令 
      cd .git # 进入当前项目的 .git 文件夹
      cat config # 查看当前的 user name 跟 email
      git config user.name "以后用于该仓库提交的身份的 user name"
      git config user.email "以后用于该仓库提交的身份 email" # 需要跟 github 上的一致
      
      # 查看文件是否修改成功 主要看 username useremail
      cat config 
      ```

2. 后续执行

   ```shell
   
   # 返回上一级目录 根目录
   cd ../
   # 创建脚本文件 代码如下 
   touch email.sh
   # 打开文件 加入以下代码
   # ---------------------------------------------------------------脚本文件的代码
   #!/bin/sh
   
   git filter-branch --env-filter '
   
   OLD_EMAIL="之前错误提交的那个身份的邮箱"
   CORRECT_NAME="新的正确的身份的名字"
   CORRECT_EMAIL="新的正确的邮箱"
   
   # 执行修复的代码
   if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
   then
       export GIT_COMMITTER_NAME="$CORRECT_NAME"
       export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
   fi
   if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
   then
       export GIT_AUTHOR_NAME="$CORRECT_NAME"
       export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
   fi
   ' --tag-name-filter cat -- --branches --tags
   # ---------------------------------------------------------------脚本文件的代码
   # 保存 
   # 本质上小绿点是根据邮箱为关键字段去确认的
   
   # mac 上修改文件的权限 如果发生 permission denied 的情况
   chmod 777 email.sh
   
   # 执行脚本
   ./email.sh
   # 会出现重写前的倒计时警告, 给 ctrl C 去取消, 过一会就会陆续重写所有记录
   
   # 重写所有记录之后 重新 push 到 remote repo]
   git push origin --force --all
   # 或者修改一下文件 然后重新 git add . commit push ...
   
   # 如果 第二次想要继续执行 email.sh 的文件报错的时候 说 本地已经有一个 backup 
   git update-ref -d refs/original/refs/heads/main # 删除本地的一个备份 才能进行 rewrite
   # 实在不行的话 就把整个本地的 repo 删掉, 重新下载, 然后进去 .git 重新配置该 repo 下的 username email
   # 重新执行上面的步骤
   ```

   
