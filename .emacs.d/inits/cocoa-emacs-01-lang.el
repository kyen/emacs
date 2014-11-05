;; Mac
;; 標準フォント
(set-default-font "Bitstream Vera Sans Mono-11")

;; 英語
(set-face-attribute 'default nil
                    :family "Menlo" ;; font
                    :height 140)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
 ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
 (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font
