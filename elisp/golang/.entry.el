;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; golang develop environment configure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq golang-config-dir (concat root-config-dir "/elisp/golang"))

(add-to-list 'load-path golang-config-dir)

;;;;;; go-mode ;;;;;;;
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda()
			  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;; 如果是Mac OS X系统，则需要借助exec-path-from-shell将GOPATH环境变量拷贝到emacs中
;; 具体问题可以参考https://github.com/purcell/exec-path-from-shell
;; 该插件在common目录下已经安装，此处可以直接使用
(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH"))


;;;;;; goflymake ;;;;;;
;; 如果你要使用goflymake，请参考https://github.com/dougm/goflymake先安装一下goflymake。
;; 如果你已经安装了go语言环境，并且设置了GOPATH环境变量，则可以直接运行下面命令安装goflymake：
;;    go get -u github.com/dougm/goflymake
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


;;;;; auto-complete ;;;;;;
;; 如果要使用company-go，则需要先安装gocode，请参考
;; https://github.com/nsf/gocode
(require 'go-autocomplete)

;;;;;; company-go ;;;;;;
;; company-go是auto-complete的一个替代品，比auto-complete小，
;; 但是功能和效果确实没有auto-complete好。
;;
;; 如果要使用company-go，则需要先安装gocode，请参考
;; https://github.com/nsf/gocode
;(add-to-list 'load-path (concat golang-config-dir "/company"))
;(require 'company)
;(require 'company-go)
;; Only use company-mode with company-go in go-mode
;; By default company-mode loads every backend it has.
;; If you want to only have company-mode enabled in go-mode add the following
;(add-hook 'go-mode-hook
;	  (lambda()
;	    (set (make-local-variable 'company-backends) '(company-go))
;	    (company-mode)))
;; Possible improvements
;(defun improve-company() 
;  (setq company-tooltip-limit 20)  ; bigger popup window
;  (setq company-idle-delay .3)     ; decrease delay before autocompletion popup shows
;  (setq company-echo-delay 0)      ; remove annoying blinking
;  (setq company-begin-commands '(self-insert-command))  ;; start autocompletion only after typing
;  )
;(improve-company)



;;;;;; go-errcheck ;;;;;;
(require 'go-errcheck)
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kbd "C-c C-e c") 'go-errcheck)))


;;;;;; flycheck ;;;;;;
;; https://github.com/favadi/flycheck-gometalinter
;; Install gometalinter and install all available checkers with:
;;    `gometalinter --install --update`
(require 'flycheck-gometalinter)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)
;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; only show errors
;; (setq flycheck-gometalinter-errors-only t)
;; only run fast linters
(setq flycheck-gometalinter-fast t)
;; use in tests files
(setq flycheck-gometalinter-test t)
;; disable linters
(setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
;; Only enable selected linters
;; (setq flycheck-gometalinter-disable-all t)
;; (setq flycheck-gometalinter-enable-linters '("golint"))
;; Set different deadline (default: 5s)
(setq flycheck-gometalinter-deadline "10s")
