(provide 'setup-fzf)

;; use local copy of package instead
;;(use-package fzf
;;  :ensure t
;;  :bind ("C-p" . fzf)
;;  :bind ("M-p" . fzf-reindex)
;;  :config
;;  (setq fzf/window-height 30)
;;  (setq fzf/executable "fzf_with_caching.sh")
;;  (setq fzf/args "noreindex --no-hscroll --margin=0,1,1,0 -x --print-query")
;;  (setq fzf/args-reindex "reindex --no-hscroll --margin=0,1,1,0 -x --print-query"))

(add-to-list 'load-path "~/.emacs.d/local/fzf")
(require 'fzf)
(global-set-key (kbd "C-p") 'fzf)
(global-set-key (kbd "M-p") 'fzf-reindex)
(setq fzf/window-height 30)
(setq fzf/executable "fzf_with_caching.sh")
(setq fzf/args "noreindex --no-hscroll --margin=0,1,1,0 -x --print-query")
(setq fzf/args-reindex "reindex --no-hscroll --margin=0,1,1,0 -x --print-query")

