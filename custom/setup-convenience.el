(provide 'setup-convenience)

;; GROUP: Convenience -> Revert

;; update any change made on file to the current buffer
(global-auto-revert-mode)

;; GROUP: Convenience -> HL Line
(global-hl-line-mode)

;; GROUP: Convenience -> Ibuffer
(setq ibuffer-use-other-window t) ;; always display ibuffer in another window

;; GROUP: Convenience -> Linum
(add-hook 'prog-mode-hook 'linum-mode) ;; enable linum only in programming modes

;; GROUP: Convenience -> Whitespace

;; whenever you create useless whitespace, the whitespace is highlighted
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: company              ;;
;;                               ;;
;; GROUP: Convenience -> Company ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: ibuffer-vc           ;;
;;                               ;;
;; GROUP: Convenience -> ibuffer ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ibuffer-vc
  :ensure t)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;;(remove-hook 'find-file-hooks 'vc-find-file-hook)
(setq vc-handled-backends nil)

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES: projectile             ;;
;;                                  ;;
;; GROUP: Convenience -> Projectile ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package projectile
  :ensure t
  :defer 1
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; ??
(global-linum-mode t)
