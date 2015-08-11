;; initialize el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; init loader
(el-get-bundle! init-loader)

(setq init-loader-show-log-after-init nil)
(init-loader-load
 (expand-file-name "inits"
		   (file-name-directory (file-truename load-file-name))))
