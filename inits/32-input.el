;;-------------------------
;; kill-ring
;; -> anything に移行
;;-------------------------
;;(autoload 'kill-summary "kill-summary" nil t)
;;(global-set-key "\M-y" 'kill-summary)

;; 自動補完
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (expand-file-name "auto-comlete/ac-dict" user-emacs-directory))
(ac-config-default)
(setq ac-use-menu-map t)

;; 現在行ハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; 複数ライン同時変更
(require 'multiple-cursors)
(require 'expand-region)
(require 'smartrep)

(declare-function smartrep-define-key "smartrep")

(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(defun mc/edit-lines-or-string-rectangle (s e)
  "C-x r tで同じ桁の場合にmc/edit-lines (C-u M-x mc/mark-all-dwim)"
  (interactive "r")
  (if (eq (save-excursion (goto-char s) (current-column))
          (save-excursion (goto-char e) (current-column)))
      (call-interactively 'mc/edit-lines)
    (call-interactively 'string-rectangle)))
(global-set-key (kbd "C-x r t") 'mc/edit-lines-or-string-rectangle)

(defun mc/mark-all-dwim-or-expand-region (arg)
  (interactive "p")
  (cl-case arg
    (16 (mc/mark-all-dwim t))
    (4 (mc/mark-all-dwim nil))
    (1 (call-interactively 'er/expand-region))))

;; C-M-SPCでer/expand-region
;; C-u C-M-SPCでmc/mark-all-in-region
;; C-u C-u C-M-SPCでmc/edit-lines
(global-set-key (kbd "C-M-SPC") 'mc/mark-all-dwim-or-expand-region)

;; ace-jump-mode
;; ヒント文字に使う文字を指定する
(setq ace-jump-mode-move-keys
      (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
;; ace-jump-word-modeのとき文字を尋ねないようにする
(setq ace-jump-word-mode-use-query-char nil)
(global-set-key (kbd "C-;") 'ace-jump-word-mode)
(global-set-key (kbd "C-M-;") 'ace-jump-line-mode)

(global-ace-isearch-mode 1)

