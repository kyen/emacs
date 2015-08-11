;;-------------------------
;;SKK
;;-------------------------
(add-to-list 'load-path (locate-user-emacs-file "skk"))
;;(require 'skk-autoloads)

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-mode)
(global-set-key "\C-xt" 'skk-tutorial)

(setq skk-large-jisyo
      (expand-file-name "skk/SKK-JISYO.L" user-emacs-directory))

