(require 'cl)

(defvar el-get-package-list
  '(
    ag
    shell-history
    shell-pop
    color-theme
    color-theme-almost-monokai
    gtags
    helm
    helm-ls-git
    helm-gtags
    flymake
    emmet-mode
    yaml-mode
    arduino-mode
    emacs-w3m
    auto-install
    cygwin-mount
    howm
    undo-tree
    auto-complete
    org
    magit
    powerline
    rainbow-delimiters
    multiple-cursors
    smartrep
    evil
    ddskk
    wgrep
    elpa:helm-ag
    elpa:helm-emmet
    elpa:helm-flymake
    elpa:dart-mode
    elpa:zenburn-theme
    elpa:molokai-theme
    elpa:solarized-theme
    elpa:wgrep-ag
    ))

(loop for pkg in el-get-package-list
      do (eval `(el-get-bundle ,pkg)))

;;(defvar el-get-package-list-from-elpa
;;  '(
;;    ;; ここに使っているパッケージを書く。
;;    ))
;;
;;(loop for pkg in el-get-package-list-from-elpa
;;      for pkg_with_elpa = (intern-soft (concat "elpa:" pkg))
;;      do (eval `(el-get-bundle ,pkg_with_elpa)))
