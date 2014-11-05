;;-------------------------
;;SKK
;;-------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/skk")
(require 'skk-autoloads)

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-mode)
(global-set-key "\C-xt" 'skk-tutorial)

(setq skk-large-jisyo "~/.emacs.d/lisp/skk/SKK-JISYO.L")
