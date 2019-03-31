;;; cl-libify-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "cl-libify" "cl-libify.el" (23713 2541 957697
;;;;;;  619000))
;;; Generated autoloads from cl-libify.el

(autoload 'cl-libify "cl-libify" "\
Replace cl symbol names between BEG and END with their cl-lib equivalents.

If no region is supplied, this operates on the entire
buffer.  With prefix argument PROMPT, ask the user to confirm each
replacement.

\(fn BEG END)" t nil)

(autoload 'cl-libify-mark-cl-symbols-obsolete "cl-libify" "\
Make all the `cl' vars and functions obsolete so that byte compilation will flag their use.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cl-libify-autoloads.el ends here
