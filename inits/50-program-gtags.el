;;--------------------------------------------------
;;GTAG
;;--------------------------------------------------
(require 'gtags)
(require 'anything-gtags)

(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

;; gtags-mode を使いたい mode の hook に追加する
(add-hook 'c-mode-common-hook
          '(lambda()
           (gtags-mode 1)))
