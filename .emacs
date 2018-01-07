;; --------------------------------------------------
;; Emacs init file (based on Frontmacs)
;;
;;
;; Sergi Valverde
;; 2018
;; --------------------------------------------------


;; load packages + frontemacs
(package-initialize)
(load (expand-file-name "init-frontmacs.el" user-emacs-directory))

;; --------------------------------------------------
;; org-mode configuration
;; org-mode configuration now lives in a separate file
;;
;; .emacs.d/org-mode-config.el
;; --------------------------------------------------
(load "~/.emacs.d/org-mode-config")


;; ..................................................
;; multiple-cursors
;; - added custom key-bindings
;; ..................................................
(require 'multiple-cursors)
(global-set-key (kbd "C-c e") 'mc/edit-lines)
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m") 'mc/mark-more-like-this-extended)


;; ..................................................
;; python mode
;; ..................................................
(elpy-enable)
(setq indent-tabs-mode nil)
(setq python-indent-offset 4)
;;(setq highlight-indentation-mode nil)
(setq elpy-rpc-backend "jedi")

;;(setenv "WORKON_HOME" "/home/s/bin/Miniconda2/envs")
;;(setenv "WORKON_HOME" "/sshx:knuth:/home/s/miniconda2/envs")

;;(pyvenv-mode 1)

;; ..................................................
;; LaTeX (AUCTEX)
;; ..................................................
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


;; ..................................................
;; windmove
;; ..................................................

(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c j")    'windmove-up)
(global-set-key (kbd "C-c k")  'windmove-down)


;; ..................................................
;; deft mode (http://jblevins.org/projects/deft/)
;; -used for maintaining a quick access to org-notebooks
;; ..................................................
(require 'deft)
(setq deft-extensions '("org" "txt"))
(setq deft-default-extension "org")
(setq deft-directory "~/Dropbox/org")
(setq deft-recursive t)
(global-set-key [f2] 'deft)
;;(global-set-key (kbd "C-c d n") 'deft-new-file)
;;(global-set-key (kbd "C-c d d") 'deft-delete-file)
;; ....................................
