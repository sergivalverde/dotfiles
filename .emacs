;; --------------------------------------------------
;; Emacs init file --> Sergi Valverde
;; Sergi valverde August 2015
;;
;; - installed packages (all melpa)
;;   - ido
;;   - autopair
;;   - company-mode
;;   - solarized-theme
;;   - org-download
;;   - ob-ipython
;;   - multiple-cursors
;;   - phi-search
;;   - elpy
;;   - auctex
;;   - neotree
;;   - deft
;; --------------------------------------------------

;; ..................................................
;; package-control
;; ..................................................
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			  ("marmalade" . "https://marmalade-repo.org/packages/")
			   ("elpy" . "http://jorgenschaefer.github.io/packages/")
			    ("melpa" . "http://melpa.milkbox.net/packages/")))


;; ..................................................
;; general configurations
;; - Interactive mode : ido-mode
;; - autopair
;; - company mode for all buffers
;; - solarized theme
;; - visual-line-mode on test-mode buffers
;; ..................................................

(require 'ido) (ido-mode t)
(require 'autopair)
(autopair-global-mode)
(show-paren-mode 1)
(add-hook 'after-init-hook 'global-company-mode)


(when window-system
  ;;(load-theme 'solarized-dark t)
  (load-theme 'atom-one-dark t)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(org-startup-indented t)
 '(safe-local-variable-values (quote ((org-download-image-dir . "media/"))))
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)



;; ..................................................
;; org-mode
;; - org-download
;; - python babel
;; - set org-indent-mode to default
;; - org-ref (reference manager)
;; ..................................................
(require 'ob-ipython)
(setq exec-path (append exec-path '("~/.local/bin")))
(add-to-list 'load-path "~/.local/bin")
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(setq org-src-fontify-natively t)

(require 'org-download)
(setq-default org-download-heading-lvl nil)
(org-babel-do-load-languages
 'org-babel-load-languages'(
			    (dot . t)
			    (ipython .t)
			    (python .t)
			    ))
(setq org-confirm-babel-evaluate nil)
(setq org-display-inline-images t)

;; syntax highlighting
(require 'htmlize)
(require 'ox-latex)
;;(add-to-list 'org-latex-packages-alist '("" "minted"))
;;(setq org-latex-listings 'minted)

;; org-ref (manage bibtex on org-mode files)
(require 'org-ref)
(setq reftex-default-bibliography '("~/Dropbox/.org/.refs/library.bib"))
(setq org-ref-default-bibliography '("~/Dropbox/.org/.refs/library.bib"))
(setq helm-bibtex-bibliography "~/Dropbox/.org/.refs/library.bib")
(setq helm-bibtex-library-path "~/Dropbox/w/phd/journals/")
(setq org-latex-pdf-process
'("pdflatex %f" "bibtex %b" "pdflatex %f" "pdflatex %f"))

;; ..................................................
;; Magit
;; ..................................................

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

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
;; phy-search
;; ..................................................
(require 'phi-search)
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)


;; ..................................................
;; python mode
;; ..................................................
(elpy-enable)
(setq indent-tabs-mode nil)
(setq python-indent-offset 4)

;; ..................................................
;; LaTeX (AUCTEX)
;; ..................................................
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
(setq reftex-plug-into-AUCTeX t)


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
(global-set-key (kbd "C-c d n") 'deft-new-file)
(global-set-key (kbd "C-c d d") 'deft-delete-file)

;; ..................................................
;; neotree
;; - theme ascii 
;; --------------------------------------------------
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii)

;; ..................................................
;; windmove
;; ..................................................

(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c j")    'windmove-up)
(global-set-key (kbd "C-c k")  'windmove-down)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono derivative Powerline" :foundry "DAMA" :slant normal :weight normal :height 113 :width normal))))
 '(ein:cell-input-area ((t (:background "#002b36")))))

;; ..................................................
;; yas minor mod
;; ..................................................

(require 'yasnippet)
;;;(add-to-list 'load-path "~/.emacs.d/snippets")
;;;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20160718.1846/snippets")
     
(yas-global-mode 1)

;; ..................................................
;; Jupyter notebooks
;; ..................................................
(require 'ein)
(require 'auto-complete)
(setq ein:use-auto-complete t)
(setq ein:use-smartrep t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

;; ..................................................
;; tramp shortcut
;; ..................................................
(global-set-key (kbd "C-x t r") 'tramp-cleanup-all-connections)


