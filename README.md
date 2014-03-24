# 更新站点方法

1. sh mirror-site.sh 用wget镜像站点首页和分类目录到本地
2. ruby -w url_to_relative_path.rb kidslib/ebooklist/ ； 将本地静态文件中连接到原网站url的地址修改为连接到本地的相对地址
3. rysnc asset folder ； 将服务器站点的asset文件夹通过rsync同步到本地 kidslib下

# windows下可使用mongoose web server

只有45k！ <http://cesanta.com/downloads.html>

同时有 gnu/linux 和 mac 版本
