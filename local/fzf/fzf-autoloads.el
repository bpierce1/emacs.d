;;; fzf-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "fzf" "fzf.el" (0 0 0 0))
;;; Generated autoloads from fzf.el

(autoload 'fzf "fzf" "\
Starts a fzf session.

\(fn)" t nil)

(autoload 'fzf-directory "fzf" "\
Starts a fzf session at the specified directory.

\(fn DIRECTORY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "fzf" '("fzf/")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fzf-autoloads.el ends here
