(provide 'setup-faces-and-ui)

;; you won't need any of the bar thingies
;; turn it off to save screen estate
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: smooth-scrolling ;;
;;                           ;;
;; GROUP: UI -> scrolling    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scrolling - keyboard scroll one line at a time, with 10 line margin
(use-package smooth-scrolling
  :ensure t)
(setq smooth-scroll-margin 10)

(size-indication-mode t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
;; taken from prelude-ui.el
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                                    (abbreviate-file-name (buffer-file-name))
                                                  "%b"))))

;; change font to Inconsolata for better looking text
;; remember to install the font Inconsolata first
(setq default-frame-alist '((font . "Inconsolata-14")))
;; set italic font for italic face, since Emacs does not set italic
;; face automatically
(set-face-attribute 'italic nil
                    :family "Inconsolata-Italic")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: highlight-numbers         ;;
;;                                    ;;
;; GROUP: Faces -> Number Font Lock   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package highlight-numbers
  :ensure t)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(use-package highlight-symbol
  :ensure t)

(highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

(setq highlight-symbol-idle-delay 0.2
      highlight-symbol-on-navigation-p t)

(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (goto-char (posn-point (event-start event)))
                  (highlight-symbol-at-point)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: monokai-theme ;;
;;                        ;;
;; GROUP: UI -> Theme     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package monokai-theme
  :ensure t)


;; initial window size
(when window-system (set-frame-size (selected-frame) 134 76))

(global-set-key (kbd "C-M-<RET>") 'toggle-fullscreen)

;; easily split windows
(global-set-key (kbd "M-v") 'evil-window-vsplit)


;;;; overridden by evil config
;;;; window navigation
;;(global-set-key (kbd "C-k") 'windmove-up)
;;(global-set-key (kbd "C-j") 'windmove-down)
;;(global-set-key (kbd "C-h") 'windmove-left)
;;(global-set-key (kbd "C-l") 'windmove-right)
