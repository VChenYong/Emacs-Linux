;; http://lotabout.me/orgwiki/emacs-helm.html
(require 'helm-config)
(when (package-installed-p 'helm)
  ;; change default prefix key
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  ;; helm-M-x
  (setq helm-M-x-fuzzy-match t)
  (global-set-key (kbd "M-x") 'helm-M-x)

  ;; helm-kill-ring
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)

  ;; helm-mini
  (global-set-key (kbd "C-x b") 'helm-mini)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)

  ;; helm-find-files
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  )

(provide 'init-helm)