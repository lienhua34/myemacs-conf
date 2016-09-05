# 关于 #
这个是的emacs的配置文件信息。

## 目录结构 ##
根目录下的.entry.el是总的入口配置文件。

在elisp目录下，
- common：存放通用的配置
- 其它目录则是各种语言环境相关的配置

每个目录下都会有一个.entry.el作为配置入口，然后在根目录的.entry.el中使用load-file方法加载各个环境下的.entry.el配置文件。

# 安装 #

## clone到~/.emacs.d目录 ##

默认情况下，我会将我的配置文件clone到~/.emacs.d目录下，
```
git clone https://github.com/lienhua34/myemacs-conf ~/.emacs.d
```
然后在~/.emacs文件中加入加载根目录的.entry.el即可，
```
(load-file "~/.emacs.d/.entry.el")
```

## clone到其它目录 ##

如果将该库clone到其它目录了，则需要修改一下根目录下的.entry.el文件中的变量root-config-dir修改一下，
```
(setq root-config-dir "/path/to/your/clone/dir")
```
在~/.emacs文件
```
(load-file "/path/to/your/clone/dir/.entry.el")
```
