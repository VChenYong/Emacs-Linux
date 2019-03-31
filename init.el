
;;(require 'server)
;;(unless (server-running-p)
;;  (cond
;;   ((eq system-type 'windows-nt)
;;    (setq server-auth-dir "~\\.emacs.d\\server\\"))
;;   ((eq system-type 'gnu/linux)
;;    (setq server-auth-dir "~/.emacs.d/server/")))
;;  (setq server-name "emacs-server-file")
;;  (server-start))

;;(defun my-done ()
;;  (interactive)
;;  (server-edit)
;;  (make-frame-invisible nil t))
;;(global-set-key (kbd "C-x C-c") 'my-done)

;;(byte-recompile-directory (expand-file-name "C:/yong/GIT/MyEmacs") 0)
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
;; (defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
;; (require 'init-compat)
(require 'init-utils)
(require 'init-common-sittings)
;;(require 'read-only)


;; Needed for Emacs version < 24. must come before elpa, as it may provide package.el
;; (require 'init-site-lisp)

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)
;; (require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; (require-package 'wgrep)
;; (require-package 'project-local-variables)
;; (require-package 'diminish)
;; (require-package 'scratch)
;; (require-package 'mwe-log-commands)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;;(require 'init-space-themes)
;;(require 'init-themes)
(require 'init-dired)


(require 'init-recentf)
(require 'init-ido)
(require 'init-yasnippet)
(require 'init-hippie-expand)
(require 'init-auto-complete)

;;(require 'init-fonts)
(require 'init-tabbar)
(require 'init-editing-utils)

(require 'init-git)


(require 'init-markdown)
;; do i need this AUCTeX - Sophisticated document creation - GNU
;;(require 'init-auctex)

;; (require 'init-javascript)

(require 'init-my-org)

;(require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;;(require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;   (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)

;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;; ;;----------------------------------------------------------------------------
;; ;; Variables configured via the interactive 'customize' interface
;; ;;----------------------------------------------------------------------------
;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (when (file-exists-p custom-file)
;;   (load custom-file))


;; ;;----------------------------------------------------------------------------
;; ;; Allow users to provide an optional "init-local" containing personal settings
;; ;;----------------------------------------------------------------------------
;; (when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
;;   (error "Please move init-local.el to ~/.emacs.d/lisp"))
;; (require 'init-local nil t)


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
;; (require 'init-locales)

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))


(provide 'init)


;;---------------------------------------------------------------------------------
;; Yasnippet tab key binding workaround
;;---------------------------------------------------------------------------------
;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;(define-key yas-minor-mode-map (kbd "TAB") nil)
;(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)


;(require 'iedit)
;(global-set-key (kbd "C-;") 'iedit-mode)



;; show all files under speedbar




;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))


;;https://github.com/abo-abo/avy
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)



(global-set-key (kbd "M-a") 'forward-whitespace) ; Alt+a


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-hl-line-mode +1)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



;;http://emacsredux.com/blog/2013/05/04/erase-buffer/
;; enable erase-buffer command
(put 'erase-buffer 'disabled nil)
(global-set-key (kbd "C-c E")  'erase-buffer)


;;http://emacsredux.com/blog/2013/03/27/open-file-in-external-program/
(defun open-with (arg)
  "Open visited file in default external program.
   With a prefix ARG always prompt for command to use."
  (interactive "P")
  (when buffer-file-name
    (shell-command (concat
                    (cond
                     ((and (not arg) (eq system-type 'darwin)) "open")
                     ((and (not arg) (member system-type '(gnu gnu/linux gnu/kfreebsd))) "xdg-open")
                     (t (read-shell-command "Open current file with: ")))
                    " "
                    (shell-quote-argument buffer-file-name)))))


(global-set-key (kbd "C-c o") 'open-with)



;;http://emacsredux.com/blog/2013/05/18/instant-access-to-init-dot-el/
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
(find-file-other-window "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c I") 'find-user-init-file)

;;http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;;http://emacsredux.com/blog/2013/05/30/joining-lines/
;; M-^


;; testing org archive



;; Include agenda archive files when searching for things
(setq org-agenda-text-search-extra-files (quote (agenda-archives)))

;;(require 'multiple-cursors)
;;(global-set-key (kbd "C-c m c") 'mc/edit-lines)
;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


;; evaluate all code blocks when exporting in emacs org-mode without typing yes
(setq org-confirm-babel-evaluate nil)


;;Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;(setq ps-printer-name "\\kvh-ca-qmfsps.ca.kronos.com\RICOH Aficio MP C3002 PCL 6")


;;(setq ps-printer-name t)
;;(setq ps-lpr-command "C:\yong\tools\emacs\.emacs.d\gs918w64.exe")
;;(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH"
;;                        "-sDEVICE=mswinpr2"
;;                        "-sPAPERSIZE=a4"))


(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)


;;
;;
;;(eval-after-load 'js2-mode
;;  '(add-hook 'js2-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;;
;;;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;(eval-after-load 'js
;;  '(add-hook 'js-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;;
;;(eval-after-load 'json-mode
;;  '(add-hook 'json-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;;
;;;;(eval-after-load 'sgml-mode
;;;;  '(add-hook 'html-mode-hook
;;;;             (lambda ()
;;;;               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
;;
;;(eval-after-load 'css-mode
;;  '(add-hook 'css-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))
;;
;;
;;
;;
;;(eval-after-load 'js2-mode
;;  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;;;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;(eval-after-load 'js
;;  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
;;
;;(eval-after-load 'json-mode
;;  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;;
;;(eval-after-load 'sgml-mode
;;  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;;
;;(eval-after-load 'css-mode
;;  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))


(setq debug-on-error t)



;; spell



;;(eval-after-load "org"
;;  '(require 'ox-md nil t))



(require 'ox-md nil t)


;; http://ergoemacs.org/emacs/elisp_change_space-hyphen_underscore.html
(defun replace-slash-toggle ()
  "Replace forward slash with back slash and vice versa
  in the current region or line.
  If there's a text selection, work on the selected text."
  (interactive)
  (let (li bds)
    (setq bds
          (if (use-region-p)
              (cons (region-beginning) (region-end))
              (bounds-of-thing-at-point 'line)))
    (setq li (buffer-substring-no-properties (car bds) (cdr bds)))
    (if (> (cl-count 47 li) (cl-count 92 li))
        (replace-string "/" "\\" nil (car bds) (cdr bds))
(replace-string "\\" "/" nil (car bds) (cdr bds)))))


;;(setq explicit-shell-file-name
;;      "C:/Program Files/Git/bin/bash.exe")
;;(setq shell-file-name explicit-shell-file-name)
;;(add-to-list 'exec-path "C:/Program Files/Git/bin")

;;(setq explicit-shell-file-name
;;      "C:/yong/tools/ConEmuPack.161002/ConEmu.exe -Here")
;;(setq shell-file-name explicit-shell-file-name)
;;;;(setq explicit-conemu-args '("-Here"))
;;(add-to-list 'exec-path "C:/yong/tools/ConEmuPack.161002)



(require 'coding-system nil t)
(require 'init-pyim nil t)
(require 'init-helm nil t)



(global-set-key "\C-x\C-\\" 'goto-last-change)

(global-set-key (kbd "M-p") 'ace-window)



;; set the font size
(set-face-attribute 'default nil :height 125)
;; start up with full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;Testing

;;(require 'remember)



;;(org-remember-insinuate)
 ;;
 ;;(setq org-directory "~/journal/")
 ;;(setq org-default-notes-file
 ;;    (concat org-directory (concat (format-time-string "%Y-%m") ".org.cpt"))
 ;;)
 ;;
 ;;(  ;;define-key global-map "\C-cr" 'org-remember)
 ;;
 ;;(require 'org-crypt)
 ;;(org-crypt-use-before-save-magic)
 ;;(setq org-tags-exclude-from-inheritance (quote ("crypt")))
 ;;;; GPG key to use for encryption
 ;;;; Either the Key ID or set to nil to use symmetric encryption.
 ;;(setq org-crypt-key nil)


;;Sync kill ring with copyq
;;https://github.com/IvanMalison/dotfiles/tree/master/dotfiles/emacs.d
(defun imalison:copyq-get (i)
  (imalison:shell-command-to-string (format "copyq eval read(%s)" i)))

(defun imalison:copyq-sync ()
  (interactive)
  (let ((missing-items (cl-loop for i from 0 to (string-to-number
                         (imalison:shell-command-to-string "copyq eval size()"))
         for item = (imalison:copyq-get i)
         when (not (member item kill-ring))
         collect item)))
    (setq kill-ring (nconc kill-ring missing-items))))

(when (executable-find "copyq")
 (run-with-idle-timer 10 nil 'imalison:copyq-sync))







(defvar my-ratio-dict
  '((1 . 1.61803398875)
    (2 . 2)
    (3 . 3)
    (4 . 4)
    (5 . 0.61803398875))
  "The ratio dictionary.")

(defun my-split-window-horizontally (&optional ratio)
  "Split window horizontally and resize the new window.
Always focus bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
      (split-window-horizontally (floor (/ (window-body-width)
                                           (1+ ratio-val)))))
     (t
      (split-window-horizontally)))
    (set-window-buffer (next-window) (other-buffer))
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-right))))

(defun my-split-window-vertically (&optional ratio)
  "Split window vertically and resize the new window.
Always focus bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
      (split-window-vertically (floor (/ (window-body-height)
                                         (1+ ratio-val)))))
     (t
      (split-window-vertically)))
    ;; open another window with other-buffer
    (set-window-buffer (next-window) (other-buffer))
    ;; move focus if new window bigger than current one
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-down))))

(global-set-key (kbd "C-x 2") 'my-split-window-vertically)
(global-set-key (kbd "C-x 3") 'my-split-window-horizontally)



;; https://superuser.com/questions/132225/how-to-get-back-to-an-active-minibuffer-prompt-in-emacs-without-the-mouse

(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)



(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(setq js2-skip-preprocessor-directives t)
(js2r-add-keybindings-with-prefix "C-c C-m")


(global-set-key "\C-s" 'swiper)

;;    Using xref-js2
;;    xref-js2 adds support for quickly jumping to function definitions or references to JavaScript projects in Emacs (>= 25.1).
;;
;;    Instead of using a tag system, it relies on ag to query the codebase of a project.
;;
;;    M-. Jump to definition
;;    M-? Jump to references
;;    M-, Pop back to where M-. was last invoked.





;;http://trey-jackson.blogspot.ca/2010/04/emacs-tip-36-abort-minibuffer-when.html

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)


(defun set-prompt ()
  (interactive)
  (comint-send-string "*shell*" "export PS1='\\u@\\h:\\w\\$ '\n")
  )

(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper) ; Menu/App key

(define-key function-key-map (kbd "<f13>") 'event-apply-super-modifier)
(message "We have loaded the GNU Emacs specific windows configurations!")


(global-auto-revert-mode 1)


(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-dark t)
    )


;;(use-package spacemacs-theme
;;  :ensure t
;;  :init
;;  (load-theme 'spacemacs-dark t)
;;  (setq spacemacs-theme-org-agenda-height nil)
;;  (setq spacemacs-theme-org-height nil))
;;
;; ;; set sizes here to stop spacemacs theme resizing these
;;(set-face-attribute 'org-level-1 nil :height 1.0)
;;(set-face-attribute 'org-level-2 nil :height 1.0)
;;(set-face-attribute 'org-level-3 nil :height 1.0)
;;(set-face-attribute 'org-scheduled-today nil :height 1.0)
;;(set-face-attribute 'org-agenda-date-today nil :height 1.1)
;;(set-face-attribute 'org-table nil :foreground "#008787")
;;
;;(use-package spaceline
;;  :demand t
;;  :init
;;  (setq powerline-default-separator 'arrow-fade)
;;  :config
;;  (require 'spaceline-config)
;;  (spaceline-spacemacs-theme))
;;
;;(provide 'init-space-themes)
;;
;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(package-selected-packages
   (quote
    (org-ref projectile f xkcd magit-gh-pulls git-timemachine helm-system-packages imenu-anywhere helm-flx flx groovy-mode gradle-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized spaceline spacemacs-theme yafolding xref-js2 whole-line-or-region whitespace-cleanup-mode web-beautify use-package undo-tree tabbar switch-window swiper smex scratch puml-mode plantuml-mode page-break-lines ox-gfm org-journal org-bullets org netherlands-holidays neotree markdown-mode magit json-mode js2-refactor ido-ubiquitous hlinum helm goto-last-change go-mode git-rebase-mode git-commit-mode gh-md fuzzy flex-isearch expand-region ensime discover-my-major dired+ color-theme chinese-pyim-greatdict chinese-pyim autopair auctex angular-mode ace-window ac-math)))
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; http://amitp.blogspot.ca/2017/01/emacs-spaceline-mode-line.html
(use-package spaceline :ensure t
  :config
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(use-package spaceline-config :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-install
   'main
   '((buffer-modified)
     ((remote-host buffer-id) :face highlight-face)
     (process :when active))
   '((selection-info :face 'region :when mark-active)
     ((flycheck-error flycheck-warning flycheck-info) :when active)
     (which-function)
     (version-control :when active)
     (line-column)
     (global :when active)
     (major-mode))))

(setq-default
 powerline-height 24
 powerline-default-separator 'wave
 spaceline-flycheck-bullet "❖ %s"
 spaceline-separator-dir-left '(right . right)
 spaceline-separator-dir-right '(left . left))



;; Todo
;;(require 'ox-reveal)
;;(setq org-reveal-root "file:///C:/reveal.js")
(setq org-reveal-root "file:///C:/yong/GIT/MyEmacs/js/reveal.js/")

(require 'init-spelling)




(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))
