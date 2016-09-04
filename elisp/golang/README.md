# 关于go-mode的特性说明以及方法和快捷键 #
要使用go-mode前先确保你本机环境安装了godef工具，如果没有，则运行下面命令：
```
go get github.com/rogpeppe/godef
```

## 函数签名处理 ##
go-mode提供了对函数签名的处理方法，其支持匿名函数，不过也可以很方便的跳过你命函数。go-mode提供了如下的函数签名处理（括号里是默认快捷键）：
- go-goto-arguments(C-c C-f a)：跳转到函数参数列表处；
- go-goto-docstring(C-c C-f d)：跳转到函数的docstring处，如果当前函数没有docstring，其会自动创建一个；
- go-goto-function(C-c C-f f)：跳转到关键字func处；
- go-goto-function-name(C-c C-f n)：跳转到函数名处；
- go-goto-return-values(C-c C-f r)：跳转到函数返回值处；
- go-goto-method-receiver(C-c C-f m)：跳转到函数的receiver处，如果当前函数没有，则会自动创建一堆括号。

在上述方法或者快捷键之前加上C-u的前缀，则可以跳过匿名函数。

## 格式化代码 ##
go语言自身提供了gofmt工具用于格式go语言的代码。emacs的go-mode借助gofmt工具来实现对正在编写的代码进行格式化。其提供了两种方式：
- 运行gofmt函数：M-x gofmt
- 添加一个保存前的hook，在保存文件前自动调用gofmt进行格式化。

目前的配置中添加了保存前的hook，
```
(add-hook 'before-save-hook 'gofmt-before-save)
```

## 查看文档说明 ##
go-mode结合godoc工具提供了查看包或者某个标识符的docstring说明，
- M-x godoc：查看包的文档说明，会提示你输入包名称
- M-x godoc-at-point：查看当前光标所在位置的标识符的docstring说明

## import的管理 ##
go-mode提供了三个对import进行管理的方法：
- go-goto-imports(C-c C-f i)：跳转到文件的import处；
- go-import-add(C-c C-a)：添加新package的import；如果快捷键加上C-u前缀会提示要import的package的别称；
- go-remove-unused-imports：删除或者注释掉没有用到的import，该方法默认没有绑定快捷键，本配置中将该方法绑定到快捷键“C-c C-r”了。
```
(add-hook 'go-mode-hook (lambda()
                         (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
```

## 代码浏览 ##
go-mode提供了标准的一些代码浏览操作快捷键，例如：
- beginning-of-defun(C-M-a)：光标快速移动到函数定义开头；
- end-of-defun(C-M-e)：光标快速移动到函数定义末尾；
- mark-defun(C-M-h)：快速标记当前函数的整个内容；
- narrow-to-defun(C-x n d)：只查看当前函数的内容；

另外，go-mode结合godef工具提供了如下三个功能：
- godef-describe(C-c C-d)：查看当前光标所在处的标识符的说明（什么类型或者其docstring说明）；
- godef-jump(C-c C-j)：跳转到光标所在处的标识符的定义处（在当前窗口）；
- godef-jump-other-window(C-x 4 C-c C-j)：跳转到当前光标所在处的标识符的定义处，在新窗口打开。


# goflymake #
goflymake是针对go语言代码执行on-the-fly语法检查的minor-mode。其执行检查的三个时间点是，
- 缓冲区加载后；
- 换行时；
- 超过0.5s之前修改的内容。

goflymake提供的方法有：
- flymake-mode：关闭或打开goflymake模式；
- flymake-start-syntax-check：执行语法检查；
- flymake-stop-all-syntax-checks：停止所有语法检查；
- flymake-goto-next-error(C-c C-e n)：跳到下一个错误点；
- flymake-goto-prev-error(C-c C-e p)：跳到前一个错误点；
- flymake-popup-current-error-menu(C-c C-e m)：以popup的方式展示当前错误点的说明。

默认情况下，这些方法都没有绑定快捷键，本配置添加了下面的快捷键绑定。
```
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))
```
