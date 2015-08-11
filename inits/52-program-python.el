;;--------------------------------------------------
;;Python style
;;--------------------------------------------------
;; 閉じカッコの補完
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; 改行時のオートインデント
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; flymake
;;(add-hook 'find-file-hook 'flymake-find-file-hook)
;;(when (load "flymake" t)
;;  (defun flymake-pyflakes-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list "pycheckers"  (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pyflakes-init)))
;;(load-library "flymake-cursor")
;;(global-set-key [f10] 'flymake-goto-prev-error)
;;(global-set-key [f11] 'flymake-goto-next-error)
