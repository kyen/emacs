;; Mac
;; 標準フォント
(set-default-font "Bitstream Vera Sans Mono-11")

;; 英語
(set-face-attribute 'default nil
                    :family "Ricty" ;; font
                    :height 140)    ;; font size

;; 日本語
;;(set-fontset-font
;; nil 'japanese-jisx0208
 ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;; (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font
;; (font-spec :family "Ricty")) ;; font
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Ricty" "iso10646-1"))
