(require 'cl)

(defvar el-get-package-list
  '(
    ag
    bm
    f
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
    ddskk
    wgrep
    ace-isearch
    avy
    exec-path-from-shell
    expand-region
    markdown-mode
    visual-regexp-steroids
    pcre2el
    org-present
    o-blog
    google-c-style
;    let-alist
;    seq
    ace-jump-mode
    w3m
    isearch-dabbrev
    plantuml-mode

    ;; emacswiki
    emacswiki:shell-history
    emacswiki:whitespace

    ;; GitHub
    yasuyk/helm-bm
    yasuyk/helm-emmet
    josteink/csharp-mode
    OmniSharp/omnisharp-emacs
    flycheck/flycheck
    tam17aki/helm-flymake
    magit/magit
    bburns/clipmon
    ))

(loop for pkg in el-get-package-list
      do (eval `(el-get-bundle ,pkg)))

(el-get-bundle dracula-theme
  :type github :pkgname "dracula/emacs")

(el-get-bundle highlight-thing
  :type github :pkgname "fgeller/highlight-thing.el")

(el-get-bundle wgrep-ag
  :type github :pkgname "mhayashi1120/Emacs-wgrep")
