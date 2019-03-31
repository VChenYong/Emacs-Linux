;;; psc-ide-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "psc-ide" "psc-ide.el" (23713 2529 477703 919000))
;;; Generated autoloads from psc-ide.el

(autoload 'psc-ide-mode "psc-ide" "\
psc-ide-mode definition

\(fn &optional ARG)" t nil)

(autoload 'psc-ide-xref-backend "psc-ide" "\
Xref backend for psc-ide.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "psc-ide-flycheck" "psc-ide-flycheck.el" (23713
;;;;;;  2529 481703 917000))
;;; Generated autoloads from psc-ide-flycheck.el

(autoload 'psc-ide-flycheck-insert-suggestion "psc-ide-flycheck" "\
Replace error with suggestion from psc compiler.

\(fn)" t nil)

(autoload 'psc-ide-flycheck-setup "psc-ide-flycheck" "\
Setup Flycheck purescript.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("psc-ide-backported.el" "psc-ide-pkg.el"
;;;;;;  "psc-ide-protocol.el") (23713 2529 477703 919000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; psc-ide-autoloads.el ends here
