;; Add and enable MELPA
(require 'package)
(setq package-enable-at-startup nil) ;; ??
(add-to-list 'package-archives
              ;;'("melpa" . "http://melpa.org/packages/") t)
              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; automatically install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; what's this for?
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; for some reason put this here
(use-package workgroups2
  :ensure t)

;; add your modules path
(add-to-list 'load-path "~/.emacs.d/custom/")

;; load your modules
(require 'setup-applications)
(require 'setup-convenience)
(require 'setup-data)
(require 'setup-development)
(require 'setup-editing)
(require 'setup-environment)
(require 'setup-external)
(require 'setup-faces-and-ui)
(require 'setup-files)
(require 'setup-help)
(require 'setup-programming)
(require 'setup-local)

(require 'setup-fzf)
(require 'setup-evil)
(require 'setup-helm)
(require 'setup-org)
;;(require 'setup-eyebrowse)
(require 'setup-elscreen)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-config fzf shell-pop smartparens-config em-alias zenburn-theme workgroups2 volatile-highlights use-package tangotango-theme tabbar smooth-scrolling monokai-theme ibuffer-vc helm-tramp helm-projectile helm-ls-git helm-flx flx-ido evil-tabs evil-surround evil-org evil-leader evil-indent-textobject dracula-theme company clean-aindent-mode cff))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
