(defvar play-sound-external-command '("mplayer" "-really-quiet"))
(defun play-sound (sound)
  (apply 'call-process
         `(,(car play-sound-external-command) nil nil nil
           ,@(cdr play-sound-external-command)
           ,(file-truename (plist-get (cdr sound) :file)))))
