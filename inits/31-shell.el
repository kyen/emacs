;;------------------------------------------------------
;; bash環境
;;------------------------------------------------------
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)

(require 'shell-history)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; shell-pop
(require 'shell-pop)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-shell-type (quote ("ansi-term" "*shell-pop-ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-z")
 '(shell-pop-window-height 40)
 '(shell-pop-window-position "bottom"))
