;;------------------------
;;C style
;;------------------------
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "bsd")
             (setq c-basic-offset 4)
             (gtags-mode 1)
             (gtags-make-complete-list)
             (setq truncate-lines t)
             ))
