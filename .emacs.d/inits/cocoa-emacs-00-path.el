;; Mac
;; ‚æ‚è‰º‚É‹Lq‚µ‚½•¨‚ª PATH ‚Ìæ“ª‚É’Ç‰Á‚³‚ê‚Ü‚·
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
;; PATH ‚Æ exec-path ‚É“¯‚¶•¨‚ğ’Ç‰Á‚µ‚Ü‚·
 (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
      (setq exec-path (append (list dir) exec-path))))
