;;-------------------------
;; dart mode
;;-------------------------
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(autoload 'dart-mode "dart-mode" "Major mode for editing Dart files" t)
(add-hook 'dart-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq c-basic-offset 2)))
