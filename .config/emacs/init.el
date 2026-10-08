;;; init.el -*- lexical-binding: t; -*-

(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))

(require 'init-state)
(require 'init-packages)
(require 'init-theme)
(require 'init-evil)
(require 'init-fonts)
(require 'init-editing)
(require 'init-dired)
(require 'init-url)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dracula-theme evil evil-collection markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-symlink ((t :slant normal)))
 '(font-latex-italic-face ((t :slant normal)))
 '(font-lock-builtin-face ((t :slant normal)))
 '(line-number ((t :slant normal)))
 '(markdown-blockquote-face ((t :slant normal)))
 '(org-quote ((t :slant normal)))
 '(shr-h3 ((t :slant normal))))
