(setq scala-config-dir (concat root-config-dir "/elisp/scala"))

;; load scala-mode
(add-to-list 'load-path (concat scala-config-dir "/scala-mode"))
(require 'scala-mode)

;; load sbt-mode
(add-to-list 'load-path (concat scala-config-dir "/sbt-mode"))
(require 'sbt-mode)
