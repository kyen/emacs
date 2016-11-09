;; Windows
;;日本語環境
(set-language-environment 'Japanese)
(setq default-input-method "japanese")

;;(set-default-coding-systems 'sjis)
;;(set-terminal-coding-system 'sjis)
;;(set-buffer-file-coding-system 'sjis)
;;(set-keyboard-coding-system 'sjis)

;; 丸数字などの機種依存文字対策
(coding-system-put 'iso-2022-jp :decode-translation-table
                   '(cp51932-decode japanese-ucs-cp932-to-jis-map))
(coding-system-put 'iso-2022-jp :encode-translation-table
                   '(cp51932-encode))

;; charset の判定する際に cp932 を sjis より優先順位を上げておくことで
;; 機種依存文字を表示できるようにする (charset と coding-system の優先度設定)。
(set-charset-priority 'ascii
                      'japanese-jisx0208
                      'latin-jisx0201
                      'katakana-jisx0201
                      'iso-8859-1
                      'cp1252
                      'unicode)
(set-coding-system-priority 'utf-8
                            'euc-jp
                            'iso-2022-jp
                            'cp932)
