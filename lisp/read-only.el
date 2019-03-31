;(setq Org-Reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;(setq Org-Reveal-title-slide nil)
(setq org-reveal-mathjax t)
;(require 'htmlize)

;;;; home dir needs to be spelled out, no '~'
(setq my-writable-dir "^C:/yong/GIT/git-notes/agenda")
(setq my-writable-dir2 "^C:/yong/GIT/MyEmacs")

;;(defun my-open-buffer-as-read-only ()
;;    "All buffers opened from directory my-read-only-dir-re are set read-only."
;;    (if (and buffer-file-name  ;; buffer is associated with a file
;;             ;; directory name matches
;;             (message "buffer-file-name (%s)" buffer-file-name)
;;             (message "my-writable-dir (%s)"  my-writable-dir)
;;             (string-match my-writable-dir  buffer-file-name)
;;             (not buffer-read-only))  ;; buffer is writable
;;      (read-only-mode 1)))
;;
;;(add-hook 'find-file-hook  #'my-open-buffer-as-read-only)


;;(add-hook 'find-file-hook
;;  '(lambda ()
;;     (when (and (buffer-file-name)
;;                (file-exists-p (buffer-file-name))
;;                (not(string-match  my-writable-dir buffer-file-name)))
;;       (message "Toggle to read-only for existing file")
;;       (toggle-read-only 1))))


(add-hook 'find-file-hook
  '(lambda ()
     (when (and (buffer-file-name)
                (not(string-match  my-writable-dir buffer-file-name))
                (not(string-match  my-writable-dir2 buffer-file-name))
        (file-exists-p (buffer-file-name))
        (file-writable-p (buffer-file-name)))
       (message "Toggle to read-only for existing file")
       (toggle-read-only 1))))


(provide 'read-only)
