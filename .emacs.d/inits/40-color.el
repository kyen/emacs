;;-------------------------------------------------------
;;ベースとなるColorの設定
;;M-x list-colors-display でリストが出せる
;;--------------------------------------------------------
;; zenburn
;;(load-theme 'zenburn t)
;;(load-theme 'molokai t)
;;(load-theme 'wombat t)
;;(set-face-attribute 'highlight nil :foreground 'unspecified)

;; color theme
;; M-x color-theme-select
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-almost-monokai)))

