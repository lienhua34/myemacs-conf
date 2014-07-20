;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up colors
;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun good-colors ()
  (progn
    (set-background-color "black")
    (set-foreground-color "LightGray")
    (set-cursor-color "DarkSlateBlue")
    (set-border-color "DimGray")
    (set-mouse-color "DarkSlateBlue")

    (set-face-background 'default "black")
    (set-face-background 'region "DarkSlateGray")
    (set-face-background 'highlight "DarkSlateBlue")
    (set-face-background 'modeline "DarkSlateBlue")

    (set-face-foreground 'default "LightGray")
    (set-face-foreground 'region "Ivory")
    (set-face-foreground 'highlight "LightGray")
    (set-face-foreground 'modeline "LightGray")
    ))
(good-colors)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom set variable
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 '(tool-bar-mode 0)        ;; gets rid of toolbar
 '(blick-cursor-mode nil)  ;; no blinking
 '(menu-bar-mode 0)        ;; no menu bar

 '(delete-key-deletes-forward t) ;; delete key deletes forward
 '(line-number-mode f)           ;; show line and column number of cursor
 '(column-number-mode t)
 '(mouse-yank-at-point t)        ;; paste where the cursor is, not mouse
 '(make-backup-files nil)        ;; defaults to no backups
 '(visible-bell t)               ;; flash
)