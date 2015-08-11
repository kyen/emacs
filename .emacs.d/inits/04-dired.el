;;-------------------------
;; find-dired
;;-------------------------
(autoload 'find-dired-lisp
  "find-dired-lisp" "findr" t nil)
(autoload 'find-grep-dired-lisp
  "find-dired-lisp" "findr" t nil)

;; wdired
(eval-after-load "dired"
  '(lambda ()
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))
