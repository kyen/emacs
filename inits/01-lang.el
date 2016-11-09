;; 標準フォント
(set-default-font "Myrica M-11:antialias=subpixel")

;; 英語
(set-face-attribute 'default nil
                    :family "Myrica M"
                    :height 120)    ;; font size

;; 日本語
;;(set-fontset-font
;; nil 'japanese-jisx0208
 ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;; (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font
;; (font-spec :family "Ricty")) ;; font
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Myrica M" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Myrica M" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Myrica M" "iso10646-1"))

