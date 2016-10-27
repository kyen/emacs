;; 起動時メッセージ削除
(setq inhibit-startup-message t)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
;; (setq auto-save-default nil)

; server start for emacs-client
(require 'server)
(if (eq window-system 'ns)
  (progn
    (server-start)
    ))
