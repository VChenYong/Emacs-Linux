;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur
(setq debug-on-error t)

(let ((minver "24.4"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "25.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-common-sittings)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

;;(require 'init-pyim)
(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-smex)
;;(require 'init-ivy)
;;(require 'init-helm)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-windows)
(require 'init-sessions)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-whitespace)

(require 'init-vc)
(require 'init-darcs)
(require 'init-git)
(require 'init-github)

(require 'init-projectile)

(require 'init-compile)
(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
;;(require 'init-php)
;;(require 'init-org)
(require 'init-my-org)
(require 'init-yasnippet)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
(require 'init-haml)
(require 'init-http)
(require 'init-python)
(require 'init-haskell)
(require 'init-elm)
;;(require 'init-purescript)
;;(require 'init-ruby)
;;(require 'init-rails)
;;(require 'init-sql)
(require 'init-rust)
;;(require 'init-toml)
(require 'init-yaml)
(require 'init-docker)
;;(require 'init-terraform)
;;(require 'init-nix)
;;(maybe-require-package 'nginx-mode)

(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(require 'init-clojure-cider)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-misc)

(require 'init-folding)
(require 'init-dash)

;;(require 'init-twitter)
;; (require 'init-mu)
(require 'init-ledger)
;; Extra packages which don't require any configuration

;;(require-package 'gnuplot)
;;(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)
(when *is-a-mac*
  (require-package 'osx-location))
(unless (eq system-type 'windows-nt)
  (maybe-require-package 'daemons))
(maybe-require-package 'dotenv-mode)

(when (maybe-require-package 'uptimes)
  (setq-default uptimes-keep-count 200)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)



(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here




;;---------------------------------------------------------------------------------
;; Yasnippet tab key binding workaround
;;---------------------------------------------------------------------------------
;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;(define-key yas-minor-mode-map (kbd "TAB") nil)
;(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)


;(require 'iedit)
;(global-set-key (kbd "C-;") 'iedit-mode)



;; show all files under speedbar




;;;; active Org-babel languages
;;(org-babel-do-load-languages
;; 'org-babel-load-languages
;; '(;; other Babel languages
;;   (plantuml . t)))
;;
;;(setq org-plantuml-jar-path
;;      (expand-file-name "~/.emacs.d/plantuml.jar"))
;;
;;
;;;;https://github.com/abo-abo/avy
;;(global-set-key (kbd "C-:") 'avy-goto-char)
;;(global-set-key (kbd "C-'") 'avy-goto-char-2)
;;(global-set-key (kbd "M-g f") 'avy-goto-line)
;;(global-set-key (kbd "M-g w") 'avy-goto-word-1)
;;
;;
;;
;;(global-set-key (kbd "M-a") 'forward-whitespace) ; Alt+a
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;(global-hl-line-mode +1)
;;
;;;; store all backup and autosave files in the tmp dir
;;(setq backup-directory-alist
;;      `((".*" . ,temporary-file-directory)))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,temporary-file-directory t)))
;;
;;
;;
;;;;http://emacsredux.com/blog/2013/05/04/erase-buffer/
;;;; enable erase-buffer command
;;(put 'erase-buffer 'disabled nil)
;;(global-set-key (kbd "C-c E")  'erase-buffer)
;;
;;
;;;;http://emacsredux.com/blog/2013/03/27/open-file-in-external-program/
;;(defun open-with (arg)
;;  "Open visited file in default external program.
;;   With a prefix ARG always prompt for command to use."
;;  (interactive "P")
;;  (when buffer-file-name
;;    (shell-command (concat
;;                    (cond
;;                     ((and (not arg) (eq system-type 'darwin)) "open")
;;                     ((and (not arg) (member system-type '(gnu gnu/linux gnu/kfreebsd))) "xdg-open")
;;                     (t (read-shell-command "Open current file with: ")))
;;                    " "
;;                    (shell-quote-argument buffer-file-name)))))
;;
;;
;;(global-set-key (kbd "C-c o") 'open-with)
;;
;;
;;
;;;;http://emacsredux.com/blog/2013/05/18/instant-access-to-init-dot-el/
;;(defun find-user-init-file ()
;;  "Edit the `user-init-file', in another window."
;;  (interactive)
;;(find-file-other-window "~/.emacs.d/init.el"))
;;
;;(global-set-key (kbd "C-c I") 'find-user-init-file)
;;
;;;;http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
;;(defun copy-file-name-to-clipboard ()
;;  "Copy the current buffer file name to the clipboard."
;;  (interactive)
;;  (let ((filename (if (equal major-mode 'dired-mode)
;;                      default-directory
;;                    (buffer-file-name))))
;;    (when filename
;;      (kill-new filename)
;;      (message "Copied buffer file name '%s' to the clipboard." filename))))
;;
;;;;http://emacsredux.com/blog/2013/05/30/joining-lines/
;;;; M-^
;;
;;
;;;; testing org archive
;;
;;
;;
;;;; Include agenda archive files when searching for things
;;(setq org-agenda-text-search-extra-files (quote (agenda-archives)))
;;
;;;;(require 'multiple-cursors)
;;;;(global-set-key (kbd "C-c m c") 'mc/edit-lines)
;;;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;
;;;; more useful frame title, that show either a file or a
;;;; buffer name (if the buffer isn't visiting a file)
;;(setq frame-title-format
;;      '((:eval (if (buffer-file-name)
;;                   (abbreviate-file-name (buffer-file-name))
;;                 "%b"))))
;;
;;
;;;; evaluate all code blocks when exporting in emacs org-mode without typing yes
;;(setq org-confirm-babel-evaluate nil)
;;
;;
;;;;Remove trailing whitespace
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;
;;
;;;;(setq ps-printer-name "\\kvh-ca-qmfsps.ca.kronos.com\RICOH Aficio MP C3002 PCL 6")
;;
;;
;;;;(setq ps-printer-name t)
;;;;(setq ps-lpr-command "C:\yong\tools\emacs\.emacs.d\gs918w64.exe")
;;;;(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH"
;;;;                        "-sDEVICE=mswinpr2"
;;;;                        "-sPAPERSIZE=a4"))
;;
;;
;;(global-set-key (kbd "<C-up>") 'shrink-window)
;;(global-set-key (kbd "<C-down>") 'enlarge-window)
;;(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
;;(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
;;
;;
;;;;
;;;;
;;;;(eval-after-load 'js2-mode
;;;;  '(add-hook 'js2-mode-hook
;;;;             (lambda ()
;;;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;;;;
;;;;;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;;;(eval-after-load 'js
;;;;  '(add-hook 'js-mode-hook
;;;;             (lambda ()
;;;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;;;;
;;;;(eval-after-load 'json-mode
;;;;  '(add-hook 'json-mode-hook
;;;;             (lambda ()
;;;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;;;;
;;;;;;(eval-after-load 'sgml-mode
;;;;;;  '(add-hook 'html-mode-hook
;;;;;;             (lambda ()
;;;;;;               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
;;;;
;;;;(eval-after-load 'css-mode
;;;;  '(add-hook 'css-mode-hook
;;;;             (lambda ()
;;;;               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))
;;;;
;;;;
;;;;
;;;;
;;;;(eval-after-load 'js2-mode
;;;;  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;;;;;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;;;(eval-after-load 'js
;;;;  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
;;;;
;;;;(eval-after-load 'json-mode
;;;;  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;;;;
;;;;(eval-after-load 'sgml-mode
;;;;  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;;;;
;;;;(eval-after-load 'css-mode
;;;;  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))
;;
;;
;;(setq debug-on-error t)
;;
;;
;;
;;;; spell
;;
;;
;;
;;;;(eval-after-load "org"
;;;;  '(require 'ox-md nil t))
;;
;;
;;
;;(require 'ox-md nil t)
;;
;;
;;;; http://ergoemacs.org/emacs/elisp_change_space-hyphen_underscore.html
;;(defun replace-slash-toggle ()
;;  "Replace forward slash with back slash and vice versa
;;  in the current region or line.
;;  If there's a text selection, work on the selected text."
;;  (interactive)
;;  (let (li bds)
;;    (setq bds
;;          (if (use-region-p)
;;              (cons (region-beginning) (region-end))
;;              (bounds-of-thing-at-point 'line)))
;;    (setq li (buffer-substring-no-properties (car bds) (cdr bds)))
;;    (if (> (cl-count 47 li) (cl-count 92 li))
;;        (replace-string "/" "\\" nil (car bds) (cdr bds))
;;(replace-string "\\" "/" nil (car bds) (cdr bds)))))
;;
;;
;;;;(setq explicit-shell-file-name
;;;;      "C:/Program Files/Git/bin/bash.exe")
;;;;(setq shell-file-name explicit-shell-file-name)
;;;;(add-to-list 'exec-path "C:/Program Files/Git/bin")
;;
;;;;(setq explicit-shell-file-name
;;;;      "C:/yong/tools/ConEmuPack.161002/ConEmu.exe -Here")
;;;;(setq shell-file-name explicit-shell-file-name)
;;;;;;(setq explicit-conemu-args '("-Here"))
;;;;(add-to-list 'exec-path "C:/yong/tools/ConEmuPack.161002)
;;
;;
;;
;;(require 'coding-system nil t)
;;;;(require 'init-pyim nil t)
;;(require 'init-helm nil t)
;;
;;
;;
;;(global-set-key "\C-x\C-\\" 'goto-last-change)
;;
;;(global-set-key (kbd "M-p") 'ace-window)
;;
;;
;;
;;;; set the font size
;;(set-face-attribute 'default nil :height 125)
;;;; start up with full screen
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;
;;
;;;;Testing
;;
;;;;(require 'remember)
;;
;;
;;
;;;;(org-remember-insinuate)
;; ;;
;; ;;(setq org-directory "~/journal/")
;; ;;(setq org-default-notes-file
;; ;;    (concat org-directory (concat (format-time-string "%Y-%m") ".org.cpt"))
;; ;;)
;; ;;
;; ;;(  ;;define-key global-map "\C-cr" 'org-remember)
;; ;;
;; ;;(require 'org-crypt)
;; ;;(org-crypt-use-before-save-magic)
;; ;;(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;; ;;;; GPG key to use for encryption
;; ;;;; Either the Key ID or set to nil to use symmetric encryption.
;; ;;(setq org-crypt-key nil)
;;
;;
;;;;;;Sync kill ring with copyq
;;;;;;https://github.com/IvanMalison/dotfiles/tree/master/dotfiles/emacs.d
;;;;(defun imalison:copyq-get (i)
;;;;  (imalison:shell-command-to-string (format "copyq eval read(%s)" i)))
;;;;
;;;;(defun imalison:copyq-sync ()
;;;;  (interactive)
;;;;  (let ((missing-items (cl-loop for i from 0 to (string-to-number
;;;;                         (imalison:shell-command-to-string "copyq eval size()"))
;;;;         for item = (imalison:copyq-get i)
;;;;         when (not (member item kill-ring))
;;;;         collect item)))
;;;;    (setq kill-ring (nconc kill-ring missing-items))))
;;;;
;;;;(when (executable-find "copyq")
;;;; (run-with-idle-timer 10 nil 'imalison:copyq-sync))
;;
;;
;;
;;
;;
;;
;;
;;(defvar my-ratio-dict
;;  '((1 . 1.61803398875)
;;    (2 . 2)
;;    (3 . 3)
;;    (4 . 4)
;;    (5 . 0.61803398875))
;;  "The ratio dictionary.")
;;
;;;;(defun my-split-window-horizontally (&optional ratio)
;;;;  "Split window horizontally and resize the new window.
;;;;Always focus bigger window."
;;;;  (interactive "P")
;;;;  (let* (ratio-val)
;;;;    (cond
;;;;     (ratio
;;;;      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
;;;;      (split-window-horizontally (floor (/ (window-body-width)
;;;;                                           (1+ ratio-val)))))
;;;;     (t
;;;;      (split-window-horizontally)))
;;;;    (set-window-buffer (next-window) (other-buffer))
;;;;    (if (or (not ratio-val)
;;;;            (>= ratio-val 1))
;;;;        (windmove-right))))
;;
;;;;(defun my-split-window-vertically (&optional ratio)
;;;;  "Split window vertically and resize the new window.
;;;;Always focus bigger window."
;;;;  (interactive "P")
;;;;  (let* (ratio-val)
;;;;    (cond
;;;;     (ratio
;;;;      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
;;;;      (split-window-vertically (floor (/ (window-body-height)
;;;;                                         (1+ ratio-val)))))
;;;;     (t
;;;;      (split-window-vertically)))
;;;;    ;; open another window with other-buffer
;;;;    (set-window-buffer (next-window) (other-buffer))
;;;;    ;; move focus if new window bigger than current one
;;;;    (if (or (not ratio-val)
;;;;            (>= ratio-val 1))
;;;;        (windmove-down))))
;;;;
;;;;(global-set-key (kbd "C-x 2") 'my-split-window-vertically)
;;;;(global-set-key (kbd "C-x 3") 'my-split-window-horizontally)
;;
;;
;;
;;;; https://superuser.com/questions/132225/how-to-get-back-to-an-active-minibuffer-prompt-in-emacs-without-the-mouse
;;
;;(defun switch-to-minibuffer-window ()
;;  "switch to minibuffer window (if active)"
;;  (interactive)
;;  (when (active-minibuffer-window)
;;    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
;;    (select-window (active-minibuffer-window))))
;;(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)
;;
;;
;;
;;
;;(global-set-key "\C-s" 'swiper)
;;
;;;;    Using xref-js2
;;;;    xref-js2 adds support for quickly jumping to function definitions or references to JavaScript projects in Emacs (>= 25.1).
;;;;
;;;;    Instead of using a tag system, it relies on ag to query the codebase of a project.
;;;;
;;;;    M-. Jump to definition
;;;;    M-? Jump to references
;;;;    M-, Pop back to where M-. was last invoked.
;;
;;
;;
;;
;;
;;;;http://trey-jackson.blogspot.ca/2010/04/emacs-tip-36-abort-minibuffer-when.html
;;
;;(defun stop-using-minibuffer ()
;;  "kill the minibuffer"
;;  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
;;    (abort-recursive-edit)))
;;
;;(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
;;
;;
;;(defun set-prompt ()
;;  (interactive)
;;  (comint-send-string "*shell*" "export PS1='\\u@\\h:\\w\\$ '\n")
;;  )
;;
;;(setq w32-pass-apps-to-system nil)
;;(setq w32-apps-modifier 'hyper) ; Menu/App key
;;
;;(define-key function-key-map (kbd "<f13>") 'event-apply-super-modifier)
;;(message "We have loaded the GNU Emacs specific windows configurations!")
;;
;;
;;(global-auto-revert-mode 1)
;;
;;
;;(use-package spacemacs-common
;;    :ensure spacemacs-theme
;;    :config (load-theme 'spacemacs-dark t)
;;    )
;;
;;
;;;;(use-package spacemacs-theme
;;;;  :ensure t
;;;;  :init
;;;;  (load-theme 'spacemacs-dark t)
;;;;  (setq spacemacs-theme-org-agenda-height nil)
;;;;  (setq spacemacs-theme-org-height nil))
;;;;
;;;; ;; set sizes here to stop spacemacs theme resizing these
;;;;(set-face-attribute 'org-level-1 nil :height 1.0)
;;;;(set-face-attribute 'org-level-2 nil :height 1.0)
;;;;(set-face-attribute 'org-level-3 nil :height 1.0)
;;;;(set-face-attribute 'org-scheduled-today nil :height 1.0)
;;;;(set-face-attribute 'org-agenda-date-today nil :height 1.1)
;;;;(set-face-attribute 'org-table nil :foreground "#008787")
;;;;
;;;;(use-package spaceline
;;;;  :demand t
;;;;  :init
;;;;  (setq powerline-default-separator 'arrow-fade)
;;;;  :config
;;;;  (require 'spaceline-config)
;;;;  (spaceline-spacemacs-theme))
;;;;
;;;;(provide 'init-space-themes)
;;;;
;;;;
;;
;;
;;;; http://amitp.blogspot.ca/2017/01/emacs-spaceline-mode-line.html
;;(use-package spaceline :ensure t
;;  :config
;;  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))
;;
;;(use-package spaceline-config :ensure spaceline
;;  :config
;;  (spaceline-helm-mode 1)
;;  (spaceline-install
;;   'main
;;   '((buffer-modified)
;;     ((remote-host buffer-id) :face highlight-face)
;;     (process :when active))
;;   '((selection-info :face 'region :when mark-active)
;;     ((flycheck-error flycheck-warning flycheck-info) :when active)
;;     (which-function)
;;     (version-control :when active)
;;     (line-column)
;;     (global :when active)
;;     (major-mode))))
;;
;;(setq-default
;; powerline-height 24
;; powerline-default-separator 'wave
;; spaceline-flycheck-bullet "❖ %s"
;; spaceline-separator-dir-left '(right . right)
;; spaceline-separator-dir-right '(left . left))
;;
;;
;;
;;;; Todo
;;;;(require 'ox-reveal)
;;;;(setq org-reveal-root "file:///C:/reveal.js")
;;(setq org-reveal-root "file:///C:/yong/GIT/MyEmacs/js/reveal.js/")
;;
;;
;;
;;
;;
;;
;;
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (markdown-mode magit undo-tree page-break-lines whole-line-or-region expand-region hlinum autopair diminish tabbar ac-math pos-tip auto-complete popup fuzzy yasnippet fullframe seq)))
;; '(speedbar-show-unknown-files t))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )
