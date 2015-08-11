;;-------------------------------------------------------
;;タブ、スベースの表示
;;--------------------------------------------------------
;;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "SystemActiveBorder"))) nil)
(defface my-face-b-2 '((t (:background "SystemWindowFrame"))) nil)
(defface my-face-u-1 '((t (:foreground "SystemHilight" :underline t))) nil)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;;タブ幅を 4 に設定
(setq-default tab-width 4)

;;タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)
;;全自動インデント指定
(setq c-auto-newline nil)
;;半自動インデント指定
(setq c-tab-always-indent nil)

;; 括弧色付け
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
