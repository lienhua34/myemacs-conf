;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is configures for c/c++ program
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq cpp-config-dir (concat root-config-dir "/elisp/cpp"))

;; cc-mode configure
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;; edit strategy for c/c++ program language
(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;; hungry-delete and auto-newline
;  (c-toggle-auto-hungry-state 1)
  ;; 按键定义
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; configure for CEDET
(load-file (concat cpp-config-dir "/cedet-1.1/common/cedet.el"))
(setq semanticdb-project-roots
      (list (expand-file-name "/")))
(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)))
(global-set-key [(control tab)] 'my-indent-or-complete)
(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list
      '(
	senator-try-expand-semantic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-expand-list
	try-expand-list-all-buffers
	try-expand-line
	try-expand-line-all-buffers
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-whole-kill
	)
     )
(global-set-key [(f5)] 'speedbar)
