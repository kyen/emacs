(require 'cl)

(defvar el-get-package-list
  '(
    ag
    bm
    f
    shell-history
    shell-pop
    gtags
    migemo
    helm
    helm-ag
    helm-ls-git
    helm-gtags
    helm-swoop
    flymake
    emmet-mode
    yaml-mode
    arduino-mode
    auto-install
    undo-tree
    auto-complete
    org
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
    markdown-mode
    visual-regexp-steroids
    pcre2el
    clipmon
    org-present
;;    o-blog
    google-c-style
    highlight-thing

    ;; elpa
    elpa:let-alist
    elpa:seq
    elpa:helm-emmet
    elpa:dart-mode
    elpa:wgrep-ag
    elpa:ace-jump-mode
    elpa:w3m

    ;; GitHub
    yasuyk/helm-bm
    josteink/csharp-mode
    OmniSharp/omnisharp-emacs
    flycheck/flycheck
    tam17aki/helm-flymake
    magit/magit
    ))

(loop for pkg in el-get-package-list
      do (eval `(el-get-bundle ,pkg)))

(el-get-bundle dracula-theme
  :type github :pkgname "dracula/emacs")
