;; �ݒ�̎Q�l
;; http://d.hatena.ne.jp/sugyan/20140227/1393511303
;;; helm
;; (package-install 'helm)
(require 'helm)
(require 'helm-ag)
(require 'helm-bm)
(require 'helm-flymake)
(require 'helm-migemo)

;;; ���̏C�����K�v(migemo and swoop)
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
       source)))

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

;;; helm-bm.el�ݒ�
(require 'helm-bm)
;; migemo���炢���悤��
(push '(migemo) helm-source-bm)
;; annotation�͂��܂�g��Ȃ��̂Ŏd�؂���ŕ\����������̌�
(setq helm-source-bm (delete '(multiline) helm-source-bm))

(defun bm-toggle-or-helm ()
  "2��A���ŋN��������helm-bm�����s������"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(global-set-key (kbd "M-SPC") 'bm-toggle-or-helm)

;; helm-swoop
(require 'helm-swoop)
;;; isearch����̘A�g���l�����C-r/C-s�ɂ����蓖�Đ���
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)

(cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
  "�V���{�������pMigemo������helm-swoop"
  (interactive)
  (let ((helm-swoop-pre-input-function
         (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol)))))
    (helm-swoop :$source (delete '(migemo) (copy-sequence (helm-c-source-swoop)))
                :$query $query :$multiline $multiline)))
;;; C-M-:�Ɋ��蓖��
(global-set-key (kbd "C-M-:") 'helm-swoop-nomigemo)
