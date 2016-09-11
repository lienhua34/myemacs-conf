
(setq common-config-dir (concat root-config-dir "/elisp/common"))

(add-to-list 'load-path common-config-dir)
(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load color-theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat common-config-dir "/color-theme"))
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

;;;;;;;;;;;;;;;;;;;;;;;
;; custom set variable
;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blick-cursor-mode nil)
 '(column-number-mode t)
 '(delete-key-deletes-forward t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(line-number-mode f)
 '(make-backup-files nil)
 '(menu-bar-mode 0)
 '(mouse-yank-at-point t)
 '(tool-bar-mode 0)
 '(visible-bell t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; load exec-path-from-shell
;; about this please refer https://github.com/purcell/exec-path-from-shell
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; load auto-complete
(load-file (concat common-config-dir "/auto-complete/.entry.el"))

;; chinese input method
;; refer to https://github.com/tumashu/chinese-pyim
;; M-x package-install RET chinese-pyim RET
;;
;;(require 'chinese-pyim)
;;(require 'chinese-pyim-basedict)
;;(chinese-pyim-basedict-enable)
;;(setq default-input-method "chinese-pyim")
;;(global-set-key (kbd "C-\\") 'toggle-input-method)

