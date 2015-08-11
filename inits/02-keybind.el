;; 大文字化[C-x C-u]・小文字化[C-x C-l]の時、問い合わせなしで実行
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; back space
(global-set-key "\C-h" 'delete-backward-char)

;;------------------------------------------------------
;; 更新処理
;;------------------------------------------------------
(global-set-key [f2] 'revert-buffer)

;;------------------------------------------------------
;; マウス設定
;;------------------------------------------------------
(if window-system (progn
;; 右ボタンの割り当て(押しながらの操作)をはずす。
(global-unset-key [down-mouse-3])

;; マウスの右クリックメニューを出す(押して、離したときにだけメニューが出る)
(defun bingalls-edit-menu (event)
  (interactive "e")
  (popup-menu menu-bar-edit-menu))
(global-set-key [mouse-3] 'bingalls-edit-menu)
))

