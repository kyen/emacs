(require 'csharp-mode)
(require 'omnisharp)

;; Cモード共通フック
(add-hook 'csharp-mode-hook
          '(lambda()
             (setq comment-column 40)
             (setq c-basic-offset 2)
;;             (font-lock-add-magic-number)
             ;; オフセットの調整
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             (hl-line-mode)
             (auto-complete-mode)
;;             (omnisharp-mode)
             )
          )

(setq omnisharp-server-executable-path
      "~/var/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
;;(setq omnisharp-server-executable-path
;;      "~/var/omnisharp-roslyn/artifacts/publish/OmniSharp/default/net451/OmniSharp.exe")

(setq omnisharp-debug t)
