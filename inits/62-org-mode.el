
;; org-modeの初期化
(require 'org-install)
(require 'org-capture)
;;(require 'o-blog)

(setq org-return-follows-link t)

;; 時間がおかしいので
(set-time-zone-rule "GMT-9")

;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-capture)

;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)

;; org-default-notes-fileのディレクトリ
(setq org-directory "c:/Users/kenya.yabe/Dropbox/memo")
(setq org-mobile-directory "c:/Users/kenya.yabe/Dropbox/mobileorg")       ; MobileOrg用ディレクトリ

;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s) WAITING(w) APPT(a)" "|"
                  "UNREVIEWED(u)" "|"
                  "DONE(d)" "CANCELLED(c) DEFERRED(f)")))

(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h)
                      ("reading" . ?r) ("films" . ?f) ("project" . ?p)
                      ("web" . ?e) ("code" . ?c)
                      ("dialy" . ?d) ("ideas" . ?i)))

;; column settings
; global Effort estimate values
(setq org-global-properties (quote ((
      "Effort_ALL" . "0:10 0:20 0:30 1:00 2:00 4:00 6:00 8:00"))))

(setq org-columns-default-format
      "%38ITEM(Details) &TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")

;; capture settings
(defvar org-template-directory
  (expand-file-name "../org/" (file-name-directory (file-truename load-file-name))))

(require 'f)
(defvar org-todo-template
  (f-read-text (concat org-template-directory "todo.txt")))
(defun org-todo-read-template ()
  org-todo-template)

(defvar org-book-review-template
  (f-read-text (concat org-template-directory "books.txt")))
(defun org-book-review-read-template ()
  org-book-review-template)

(defvar org-code-reading-software-name nil)
(defun org-code-reading-read-software-name ()
  (set (make-local-variable 'org-code-reading-software-name)
       (read-string "Code Reading Software: "
                    (or org-code-reading-software-name
                        (file-name-nondirectory
                         (buffer-file-name))))))

(defun org-code-reading-get-prog-language ()
  (substring (symbol-name major-mode) 0 -5))

(defun org-code-reading-read-template ()
  (concat "\n* %^{Title} %t :code:\n"
          ":PROPERTIES:\n"
          ":Lang: " (org-code-reading-get-prog-language) "\n"
          ":Software: " (org-code-reading-read-software-name) "\n"
          ":File: %f\n"
          ":END:\n"
          "  %a\n"
          "  Comments:\n  %?"))

(defvar org-projects-template
  (f-read-text (concat org-template-directory "projects.txt")))
(defun org-projects-read-template ()
  org-projects-template)

(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline "todo.org" "Tasks")
         (function org-todo-read-template))
        ("b" "Book" entry
,         (file+headline "journal.org" "Reviews")
         (function org-book-review-read-template))
        ("d" "Dialy" entry
         (file+headline "journal.org" "Dialy")
         "\n* %^{Title} %t :dialy:")
        ("i" "Idea" entry
         (file+headline "journal.org" "Ideas")
         "\n* %^{Title} %t :ideas:")
        ("c" "Code Reading" entry
         (file+headline "software.org" "Code Readings")
         (function org-code-reading-read-template))
        ("p" "Project" entry
         (file+headline "projects.org" "Projects")
         (function org-projects-read-template))
        ("q" "Question" entry
         (file+headline "question.org" "Question")
         (function org-todo-read-template))))

;; agenda settings
;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; アジェンダ表示で下線を用いる
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))

(setq org-agenda-custom-commands
      '(("H" "Work and Home Lists"
         ((agenda)
          (tags-todo "@work")
          (tags-todo "@home")
          (tags-todo "reading")
          (tags-todo "dvd")
          (tags-todo "project")
          (tags-todo "web")
          (tags-todo "code")))
         ("D" "Daily Action List"
          ((agenda "" ((org-agenda-ndays 1)
                       (org-agenda-sorting-strategy
                        (quote ((agenda time-up priority-down tag-up) )))
                       (org-deadline-warning-days 0)))))
         ))

(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))
     ;; 文字をどれだけ大きくするかを設定する
     (setq org-present-text-scale 5)
     ))
