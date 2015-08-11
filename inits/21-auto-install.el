;;-------------------------
;;auto install
;;-------------------------
(add-to-list 'load-path (locate-user-emacs-file "auto-install"))

(require 'auto-install)

(setq auto-install-directory
      (expand-file-name "auto-install" user-emacs-directory))
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保
