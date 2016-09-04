;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; golang develop environment configure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq golang-config-dir (concat root-config-dir "/elisp/golang"))

;;;;;; go-mode ;;;;;;;
(add-to-list 'load-path (concat golang-config-dir "/go-mode"))
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda()
			  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;;;;;; goflymake ;;;;;;
;; 如果你要使用goflymake，请参考https://github.com/dougm/goflymake先安装一下goflymake。
;; 如果你已经安装了go语言环境，并且设置了GOPATH环境变量，则可以直接运行下面命令安装goflymake：
;;    go get -u github.com/dougm/goflymake
(add-to-list 'load-path (concat golang-config-dir "/goflymake"))
(require 'go-flymake)
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))


;;(require 'go-flycheck)
