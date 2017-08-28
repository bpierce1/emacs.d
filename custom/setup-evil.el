(provide 'setup-evil)

(setq evil-want-C-u-scroll t)
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map "\C-p" 'fzf)
  ;; for org mode overrides
  (define-key evil-normal-state-map "\C-k" 'windmove-up)
  (define-key evil-normal-state-map "\C-j" 'windmove-down)
  (define-key evil-normal-state-map "\C-h" 'windmove-left)
  (define-key evil-normal-state-map "\C-l" 'windmove-right)
  ;; copy/paste
  (define-key evil-visual-state-map (kbd "C-S-C") 'ns-copy-including-secondary)
  (define-key evil-insert-state-map (kbd "C-S-V") 'yank)

  ;; in place of tabs
  (define-key evil-normal-state-map (kbd "C-i") nil)
  (define-key evil-normal-state-map (kbd "C-o") nil)

  ;; don't replace clipboard on visual paste
  (fset 'evil-visual-update-x-selection 'ignore)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t
    :config)

  (add-hook 'evil-visual-state-entry-hook (lambda() (global-hl-line-mode -1)))
  (add-hook 'evil-visual-state-exit-hook (lambda() (global-hl-line-mode +1)))

  (add-hook 'term-mode-hook 'evil-emacs-state))
