;;-------------------------
;; kill-ring
;; -> anything �Ɉڍs
;;-------------------------
;;(autoload 'kill-summary "kill-summary" nil t)
;;(global-set-key "\M-y" 'kill-summary)

;; �����⊮
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/share/auto-comlete/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)

;; ���ݍs�n�C���C�g
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)
