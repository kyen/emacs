(require 'cl)

(defvar el-get-package-list
  '(
    ag
    bm
    shell-history
    shell-pop
    color-theme
    color-theme-almost-monokai
    gtags
    migemo
    helm
    helm-ls-git
    helm-gtags
    helm-migemo
    helm-swoop
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
    ace-isearch
    avy
    exec-path-from-shell
    expand-region
    whitespace
    elpa:helm-ag
    elpa:helm-emmet
    elpa:helm-flymake
    elpa:dart-mode
    elpa:zenburn-theme
    elpa:molokai-theme
    elpa:solarized-theme
    elpa:wgrep-ag
    elpa:ace-jump-mode
    elpa:highlight-thing
    ;; from GitHub
    yasuyk/helm-bm
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
