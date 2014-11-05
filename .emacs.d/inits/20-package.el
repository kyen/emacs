(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    shell-history
    shell-pop
    color-theme
    gtags
;;    anything-gtags -> emacs-wiki
    helm
    helm-ag
    helm-ls-git
    helm-emmet
    helm-flymake
    helm-gtags
    flymake
    emmet-mode
    yaml-mode
    dart-mode
    arduino-mode
    w3m
    auto-install
    cygwin-mount
;;    howm
    undo-tree
    auto-complete
    zenburn-theme
    org
    magit
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
