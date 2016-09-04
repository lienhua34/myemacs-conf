;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto-complete
;;; 使用说明请参考http://auto-complete.org/doc/manual.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-complete-config-dir (concat common-config-dir "/auto-complete"))

(add-to-list 'load-path auto-complete-config-dir)
(require 'auto-complete-config)
(ac-config-default)
;; define key M-TAB to manually active completion
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; 设置C-p和C-n为联想项的上下选择键
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; 设置联想menu的高度
(setq ac-menu-height 20)

;; 忽略大小写（默认是smart，表示如果输入的字符串中没有大写字母才会忽略大小写）
(setq ac-ignore-case t)

;; 设置颜色
(set-face-background 'ac-candidate-face "steelblue")
(set-face-background 'ac-selection-face "darkblue")

;; load fuzzy, enable ac-fuzzy-complete
;; (require 'fuzzy)

;;;;;;;;; 联想项的帮助信息;;;;;;;;;;;;;
;; 所谓联想项的帮助信息，就是关于联想项的详细说明文档。
;; auto-complete有两种帮助显示方式：
;; （1）quick help：所谓的quick help就是在选择一个联想项后，在该联想项的右边以popup的方式显示帮助信息；
;; （2）buffer help：所谓buffer help就是在一个buffer中显示帮助信息。当联想项的帮助信息太长，quick help方式显示不方便查看时，可以选择buffer help方式。通过上下键选择一个联想项后，按<f1>键即可显示buffer help，然后通过C-M-v或C-M-S-v来上下滚动buffer help内容，其它键将会导致buffer help自动关闭。
;;
;; active quick help
(setq ac-use-quick-help t)
(setq ac-quick-help-delay .5)  ; quick help的延时显示时间

;; active comphist
;; 开启comphist后，auto-complete会根据用户联想项的选择历史进行智能提示，
;; 例如，输入某个字符序列后，某个联想项历史上选择比较多，
;; 则下次再输入该字符序列的时候，将历史上选择多的联想项提前。
(setq ac-use-comphist t)

;;;;;;;;; Complete by Dictionary ;;;;;;;;;;;
;; 字典是字符串的列表，auto-complete可以通过字典提供自动联想项的配置。
;; auto-complete支持三种类型字典：
;;  （1） user defined dictionary：用户自定义字典，包括两个列表ac-user-dictionary和ac-user-dictionary-files。其中ac-user-dictionary用于添加联想项的字符串列表，修改后立即生效；而ac-user-dictionary-files则是一个自定义字典文件的列表，这些自定义字典文件都是以换行符分割的联想项序列，默认情况下~/.dict也是一个自定义字典文件（自定义字典文件会使用缓存，所以修改不会自动生效，可以运行ac-clear-disctionary-cache来使其生效）。注：用户自定义字典可以用于所有缓冲区。
;;  （2）Major Mode Dictionary：以emacs主模式（major mode）命令的字典将只会在该主模式的缓冲区中生效，例如命名为c++-mode的字典只在c++-mode模式的缓冲区中生效。主模式字典文件是从ac-dictionary-directories指定的目录列表中加载的。auto-complete的github库的dict目录下提供了主要emacs主模式的字典文件。（注：修改或添加后，同样需要运行ac-clear-disctionary-cache来清除缓存）
;;  （3）Extension Dictionary：扩展名字典，从名称上我们可以看出它是针对文件扩展名来生效的。例如命名为cpp的字典文件只在*.cpp的缓冲区中生效。扩展名字典同样是从ac-dictionary-directories指定的目录列表中查找的。其也存在缓存。
;;
;; set Major Mode Dictionary
(add-to-list 'ac-dictionary-directories (concat auto-complete-config-dir "/ac-dict"))
;; set ac-user-dictionary
;; (add-to-list 'ac-user-dictionary "lienhua34@163.com")
;;
;; set ac-user-dictionary-files
;; (add-to-list 'ac-dictionary-files (concat auto-complete-config-dir "/.mydict"))


