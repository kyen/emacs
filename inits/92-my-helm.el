;; 設定の参考
;; http://d.hatena.ne.jp/sugyan/20140227/1393511303
;;; helm
;; (package-install 'helm)
(require 'helm)
(require 'helm-ag)
(require 'helm-bm)
(require 'helm-gtags)
(require 'helm-flymake)
(require 'helm-migemo)

;; customize
(progn
  (require 'helm-ls-git)
  (custom-set-variables
   '(helm-truncate-lines t)
   '(helm-buffer-max-length 35)
   '(helm-delete-minibuffer-contents-from-point t)
   '(helm-ff-skip-boring-files t)
   '(helm-boring-file-regexp-list '("~$" "\\.elc$"))
   '(helm-ls-git-show-abs-or-relative 'relative)
   '(helm-mini-default-sources '(helm-source-buffers-list
                                 helm-source-ls-git
                                 helm-source-recentf
                                 helm-source-buffer-not-found))))

;; set helm-command-prefix-key to "C-z"
(progn
  (require 'helm-config)
  (global-unset-key (kbd "C-z"))
  (custom-set-variables
   '(helm-command-prefix-key "C-z")))

;; gtags setting
(add-hook 'c-mode-hook 'helm-gtags-mode)
;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

;; ag
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-thing-at-point 'symbol)

;; key settings
(global-set-key (kbd "C-]") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key helm-command-map (kbd "d") 'helm-descbinds)
(define-key helm-command-map (kbd "g") 'helm-ag)
(define-key helm-command-map (kbd "o") 'helm-occur)
(define-key helm-command-map (kbd "y") 'yas/insert-snippet)
(define-key helm-command-map (kbd "M-/") 'helm-dabbrev)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(eval-after-load "helm-files"
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'helm-ff-backspace)
     (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)))

;;; helm-bm.el設定
(require 'helm-bm)
;; migemoくらいつけようね
(push '(migemo) helm-source-bm)
;; annotationはあまり使わないので仕切り線で表示件数減るの嫌
(setq helm-source-bm (delete '(multiline) helm-source-bm))

(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(global-set-key (kbd "M-SPC") 'bm-toggle-or-helm)
