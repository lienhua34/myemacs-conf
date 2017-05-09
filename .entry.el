

;; package 
(require 'package)
(setq package-archives
      '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))
(setq package-unsigned-archives (mapcar #'car package-archives))
(package-initialize)

;; config-dir变量记录的是这个库clone到本地的路径，默认是“~/.emacs.”。
;; 如果不是这个目录，则需要进行修改，因为后续加载各种环境配置入口文件均需要该变量
(setq root-config-dir "~/.emacs.d")

;; load common configure entry file
(load-file (concat root-config-dir "/elisp/common/.entry.el"))

;; load golang develop environment configure entry file
(load-file (concat root-config-dir "/elisp/golang/.entry.el"))

;; load markdown edit environment configure entry file
(load-file (concat root-config-dir "/elisp/markdown/.entry.el"))

;; load c/cpp develop environment configure entry file
;;(load-file (concat root-config-dir "/elisp/cpp/.entry.el"))

;; load scheme develop environment configure entry file
;;(load-file (concat root-config-dir "/elisp/scheme/.entry.el"))

(load-file (concat root-config-dir "/elisp/yaml/.entry.el"))

;; (load-file (concat root-config-dir "/elisp/scala/.entry.el"))

(load-file (concat root-config-dir "/elisp/protobuf/.entry.el"))

(load-file (concat root-config-dir "/elisp/groovy/.entry.el"))

;; 使用空格缩进
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)
