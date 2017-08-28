(provide 'setup-helm)

;; helm
(use-package helm
  :ensure t
  :config

  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (global-set-key (kbd "C-'") 'helm-recentf)
  (global-set-key (kbd "C-;") 'helm-buffers-list)
  (global-set-key (kbd "C-{") 'helm-do-grep-ag)
  ;;(global-set-key (kbd "C-}") (lambda () (interactive) (some-command) (some-other-command)))

  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 35)
  (setq helm-scroll-amount 1)
  (helm-autoresize-mode 1)

  (setq split-width-threshold nil)

  (global-set-key "\C-ch" help-map)

  (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
  (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))

  ;; fuzzy matching
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-limit 200)

  (with-eval-after-load 'helm-buffers
    (add-to-list 'helm-boring-buffer-regexp-list "\*scratch\*")
    (add-to-list 'helm-boring-buffer-regexp-list "\*Messages\*")
    (add-to-list 'helm-boring-buffer-regexp-list "GNU Emacs"))

  ;;(use-package helm-config
  ;;  :ensure t)
  (use-package helm-ls-git
    :ensure t)
  (use-package helm-projectile
    :ensure t)

  ;; better fuzzy helm
  (use-package flx
    :ensure t)
  (use-package helm-flx
    :ensure t
    :config
    (helm-flx-mode +1)
    (setq helm-flx-for-helm-find-files t ;; t by default
        helm-flx-for-helm-locate t) ;; nil by default
    )

  (helm-mode 1))
