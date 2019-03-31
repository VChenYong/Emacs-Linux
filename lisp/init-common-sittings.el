 ;;;;         DISPLAY SETTING   ;;;;;;;;;;;;;;;;;;;;;

;;;;;;;Show full path of the file in the title bar;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq frame-title-format '("%b   @   " buffer-file-name))

;;show the colum number at the bottom
(setq column-number-mode t)

;;match the parentheses;;;
(show-paren-mode t)

;;disbale the startup page
(setq inhibit-startup-message t)

;; *scratch* buffer message
(setq initial-scratch-message "")


;; hide tool bar
(tool-bar-mode -1)

;; hide menu bar
(menu-bar-mode nil)


;; hide scroll bar
(set-scroll-bar-mode nil)


;;display time and date
(setq display-time-day-and-date t)
;;display time
(display-time)
;;set  time  24H
(setq display-time-24hr-format t)
;;display time and date
(setq display-time-day-and-date t)
;;
(setq display-time-use-mail-icon t)
;; time chanhe interval
(setq display-time-interval 10)

;;mouse move away when cursor comes
(mouse-avoidance-mode 'animate)

;;stop cursor to blink
(blink-cursor-mode -1)
(transient-mark-mode 1)


;;grammar highlight
(global-font-lock-mode t)



;;;;;;;;;;;;;;;;;;;;;;;END DISPLAY SETTING;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(global-unset-key [left])
;;(global-unset-key [up])
;;(global-unset-key [right])
;;(global-unset-key [down])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;dsiable full page scroll
(setq     scroll-step 1
scroll-margin 3
scroll-conservatively 10000)


;;;;show line number
;;(dolist (hook (list
;;'c-mode-hook
;;'c++-mode-hook
;;'emacs-lisp-mode-hook
;;'lisp-interaction-mode-hook
;;'lisp-mode-hook
;;'emms-playlist-mode-hook
;;'java-mode-hook
;;'asm-mode-hook
;;'haskell-mode-hook
;;'rcirc-mode-hook
;;'emms-lyrics-mode-hook
;;'erc-mode-hook
;;'sh-mode-hook
;;'makefile-gmake-mode-hook
;;))
;;(add-hook hook (lambda () (linum-mode 1))))



;; add line number
(global-linum-mode t)



;;;M-x customize-group
;;;And then at the Customize group: prompt enter backup.
;;;
;;;If you scroll to the bottom of the buffer you'll see Backup Directory Alist. Click Show Value and set the first entry of the list as follows:
;;;
;;;Regexp matching filename: .*
;;;Backup directory name: /path/to/your/backup/dir
;;;Alternatively, you can turn backups off my setting Make Backup Files to off.
;;;
;;;If you don't want Emacs to automatically edit your .emacs file you'll want to set up a customisations file.


;; set bakcup file locations
(setq backup-directory-alist `(("." . ,"~/.emacs.d/saves")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/saves" t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;Delete selected text
(delete-selection-mode t)

;; goto line
(global-set-key "\C-c g" 'goto-line) ; [Ctrl]-[L]



;; cycle through buffers with Ctrl-Tab (like Firefox)
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;;(defface hl-line '((t (:background "red")))
;;  "Face to use for `hl-line-face'." :group 'hl-line)
;;(setq hl-line-face 'hl-line)
;;(global-hl-line-mode t) ; turn it on for all modes by default


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GLOBEL SETTING  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;y/n replace yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;ring maximum 200
(setq kill-ring-max 200)

;; enable recursive minibuffers
(setq enable-recursive-minibuffers t)

;; enable the clipboard from other apps
(setq x-select-enable-clipboard t)

;; default change column after 80 characters
(setq default-fill-column 80)

;;disable the error sound
(setq visible-bell t)

;;set the default work directory
(setq default-directory "~/")

;;set default mode ( text mode)
(setq default-major-mode 'text-mode)

;; my info
(setq user-full-name "YONG")
(setq user-mail-address "vincent.yongchen@gmail.com")



;; show all files under speedbar
(custom-set-variables
 '(speedbar-show-unknown-files t)
)


;; copy  full file name to clipboard
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))


(require 'dired-x)

(provide 'init-common-sittings)
