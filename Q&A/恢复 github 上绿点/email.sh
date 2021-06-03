#!/bin/sh

git filter-branch --env-filter '

#!注意!!!!!
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
