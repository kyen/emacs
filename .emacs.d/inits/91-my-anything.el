;;-------------------------
;;anything
;;-------------------------
;; http://www.emacswiki.org/cgi-bin/wiki/Anything

;; ちょっとhelm使ってみるので無効にする

; (require 'anything-startup)
; (setq my-anything-keybind (kbd "C-]"))
; ;; (global-set-key my-anything-keybind 'anything)
; (global-set-key my-anything-keybind 'my-anything)
; (define-key anything-map my-anything-keybind 'anything-exit-minibuffer)
; (define-key anything-map (kbd "C-M-n") 'anything-next-source)
; (define-key anything-map (kbd "C-M-p") 'anything-previous-source)
; 
; ;;kill-ring の最大値. デフォルトは 30.
; (setq kill-ring-max 20)
; ;;anything で対象とするkill-ring の要素の長さの最小値.
; ;;デフォルトは 10.
; (setq anything-kill-ring-threshold 5)
; (global-set-key "\M-y" 'anything-show-kill-ring)
; 
; (defun my-anything ()
;   (interactive)
;   (anything-other-buffer
;    '(anything-c-source-buffers+
;      anything-c-source-files-in-current-dir
;      anything-c-source-recentf
;      anything-c-source-file-name-history
;      anything-c-source-buffer-not-found
;      anything-c-source-imenu
;      anything-c-source-gtags-select
;      ) " *my-anything*"))
; 
; (setq imenu-auto-rescan t)
; 
; ;; anything-gtagsでgtagsの候補バッファを奪うときに違う名前でバッファを作りまくるのでどんどん残る。
; ;; gtags-select-buffer-singleを真似して事前に以前のバッファをクリアする
; (defadvice ag-hijack-gtags-select-mode (before before-ag-hijack-gtags-select-mode activate)
;   "clear buffers before hijack"
;   (setq anything-buffers nil) ;; resume用の変数もクリア。この後に来るanythingの候補が入るので直前のresumeはできる。
;   (let (now-buffer-list now-buffer)
;     (setq now-buffer-list (buffer-list))
;     (while now-buffer-list
;       (setq now-buffer (car now-buffer-list))
;       (if (string-match "*anything gtags*" (buffer-name now-buffer))
;           (kill-buffer now-buffer))
;       (setq now-buffer-list (cdr now-buffer-list)))))
; 
