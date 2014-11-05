
;; org-mode�̏�����
(require 'org-install)

;; �L�[�o�C���h�̐ݒ�
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)

;; �g���q��org�̃t�@�C�����J�������C�����I��org-mode�ɂ���
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; org-mode�ł̋����\�����\�ɂ���
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; ���o���̗]����*������
(setq org-hide-leading-stars t)

;; org-default-notes-file�̃f�B���N�g��
(setq org-directory "~/org/")

;; org-default-notes-file�̃t�@�C����
(setq org-default-notes-file "notes.org")
