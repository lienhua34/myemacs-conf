(setq markdown-config-dir (concat root-config-dir "/elisp/markdown"))

(add-to-list 'load-path markdown-config-dir)

;; load markdown-mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; load gfm-mode
;;(autoload 'gfm-mode "gfm-mode" "Major mode for editing GitHub Flavored Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;; check bracket and parentheses after save file
(add-hook 'markdown-mode-hook
	  (lambda()
	    (when buffer-file-name
	      (add-hook 'after-save-hook
			'check-parens
			nil t))))
