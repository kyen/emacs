;; window関連設定
(if window-system (progn
                    ;;フレームのサイズ
                    (if (eq window-system 'mac)
                        (progn
                          (setq initial-frame-alist '((width . 120) (height . 40)))
                          ))
                    (if (eq window-system 'w32)
                        (progn
                          (setq initial-frame-alist '((width . 120) (height . 45) (top . 35) ))
                          ))
                   ))


;;; ツールバーを消す
(tool-bar-mode 0)
;;; メニューバーも消す
(menu-bar-mode nil)
;;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f" (system-name)))

;;;; tree-undo 
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; 行列表示設定
(line-number-mode t)
(column-number-mode t)
