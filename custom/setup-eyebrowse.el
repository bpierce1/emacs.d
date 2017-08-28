(provide 'setup-eyebrowse)

(use-package eyebrowse
  :ensure t)
(define-key evil-motion-state-map (kbd "C-o") 'eyebrowse-next-window-config)
(define-key evil-motion-state-map (kbd "C-i") 'eyebrowse-prev-window-config)
(eyebrowse-mode t)

(defvar spacemacs-active-slots nil)

(defun spacemacs-eyebrowe-maybe-switch-home ()
  (interactive)
  (unless (member slot spacemacs-active-slots)
    (push slot spacemacs-active-slots)
    (delete-other-windows)
    (spacemacs/home)))

(add-hook 'eyebrowse-post-window-switch-hook 'spacemacs-eyebrowe-maybe-switch-home)

(defun spacemacs-eyebrowse-remove-slot ()
  (delete (eyebrowse-get 'last-slot) spacemacs-active-slots))

(advice-add  'eyebrowse-close-window-config :after #'spacemacs-eyebrowse-remove-slot)
