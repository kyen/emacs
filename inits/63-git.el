(add-to-list 'load-path (locate-user-emacs-file "el-get/magit/lisp"))
(require 'magit)

(add-to-list 'process-coding-system-alist '("git" utf-8 . utf-8))
(add-hook 'git-commit-mode-hook
          '(lambda ()
             (set-buffer-file-coding-system 'utf-8)))
