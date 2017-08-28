(provide 'setup-org)

;;
(use-package evil-org
             :ensure t)

;; make g work in info mode
(define-key Info-mode-map "g" nil)
(define-key Info-mode-map "n" nil)
(define-key Info-mode-map "C-j" nil)
(define-key Info-mode-map "C-k" nil)
(define-key Info-mode-map (kbd "<C-h>") nil)
(define-key Info-mode-map (kbd "<C-l>") nil)
(define-key Info-mode-map "[" 'Info-prev)
(define-key Info-mode-map "]" 'Info-next)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (setq org-todo-keywords
              '((sequence "TODO" "STRT" "|" "DONE")))

            ;; zoom/unzoom
            (define-key evil-normal-state-map "]" 'org-narrow-to-subtree)
            (define-key evil-normal-state-map "[" 'widen)
            ;; folding
            (define-key evil-normal-state-map "zv" 'org-cycle)
            ;; promote/demote
            ;;(define-key org-mode-map (kbd "<tab>") nil)
            ;;(define-key org-mode-map (kbd "<S-tab>") nil)
            (define-key org-mode-map (kbd "C-'") nil)
            (define-key org-mode-map (kbd "M-k") 'org-move-subtree-up)
            (define-key org-mode-map (kbd "M-j") 'org-move-subtree-down)
            (define-key evil-normal-state-map (kbd "M-l") 'org-demote-subtree)
            (define-key evil-normal-state-map (kbd "M-h") 'org-promote-subtree)
            ;; todo
            (define-key evil-normal-state-map "t" 'org-todo)
            (define-key evil-normal-state-map "T" 'org-shiftleft)
            ;; fix tab
            (define-key evil-normal-state-map (kbd "C-y") 'yank)))


