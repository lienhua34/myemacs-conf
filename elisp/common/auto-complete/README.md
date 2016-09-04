# auto-complete #

## 关于auto-complete ##
[auto-complete](https://github.com/auto-complete/auto-complete)是一个emacs智能自动联想和代码补全的插件，其扩展了emacs标准的自动联想接口并提供一个环境给用户自定义自己的自动联想环境。不多说，看官方网站介绍。

## 安装 ##
请参考[官方使用文档](http://auto-complete.org/doc/manual.html#manual-installation)进行安装。

下面简单介绍一下自己学习到的一些知识点。

## 联想项的选择 ##

### \<TAB\>键的使用 ###
自动联想列表显示之后，\<TAB\>键便临时被赋予了选择联想项的功能。存在下面三种情况：
- 只有一个联想项时，按\<TAB\>便是用该联想项自动补全；
- 存在多个联想项，并且所有联想项存在共同前缀，则自动补全共同前缀；
- 否则，用于在联想项列表中循环选择；

### \<RET\>键的使用 ###
\<RET\>键用于使用选中项自动补全，其效果有：
- 立即自动补全当前选中的联想项；
- 如果该选中联想项包含动作，则执行该动作。

### 其它选择键 ###
- 可用\<up\>或M-p选择上一个联想项，\<down\>或M-n选择下一个联想项；
- 使用M-\<digit\>快速使用联想列表中前10个联想项自动补全。

## 联想项的帮助信息 ##
所谓联想项的帮助信息，就是关于联想项的详细说明文档。
auto-complete有两种帮助显示方式：
- **quick help**：所谓的quick help就是在选择一个联想项后，在该联想项的右边以popup的方式显示帮助信息；
- **buffer help**：所谓buffer help就是在一个buffer中显示帮助信息。当联想项的帮助信息太长，quick help方式显示不方便查看时，可以选择buffer help方式。通过上下键选择一个联想项后，按<f1>键即可显示buffer help，然后通过C-M-v或C-M-S-v来上下滚动buffer help内容，其它键将会导致buffer help自动关闭。

## 使用字典提供联想项 ##
字典是字符串的列表，auto-complete可以通过字典提供自动联想项的配置。
auto-complete支持三种类型字典：
- **user defined dictionary**：用户自定义字典，包括两个列表ac-user-dictionary和ac-user-dictionary-files。其中ac-user-dictionary用于添加联想项的字符串列表，修改后立即生效；而ac-user-dictionary-files则是一个自定义字典文件的列表，这些自定义字典文件都是以换行符分割的联想项序列，默认情况下~/.dict也是一个自定义字典文件（自定义字典文件会使用缓存，所以修改不会自动生效，可以运行ac-clear-disctionary-cache来使其生效）。注：用户自定义字典可以用于所有缓冲区。
- **Major Mode Dictionary**：以emacs主模式（major mode）命令的字典将只会在该主模式的缓冲区中生效，例如命名为c++-mode的字典只在c++-mode模式的缓冲区中生效。主模式字典文件是从ac-dictionary-directories指定的目录列表中加载的。auto-complete的github库的dict目录下提供了主要emacs主模式的字典文件。（注：修改或添加后，同样需要运行ac-clear-disctionary-cache来清除缓存）
- **Extension Dictionary**：扩展名字典，从名称上我们可以看出它是针对文件扩展名来生效的。例如命名为cpp的字典文件只在*.cpp的缓冲区中生效。扩展名字典同样是从ac-dictionary-directories指定的目录列表中查找的。其也存在缓存。
